# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


class User < ApplicationRecord
  attr_reader :password
  after_initialize :ensure_session_token

  validates :password, allow_nil:true, length:{minimum: 6}
  validates :session_token, :username, presence:true, uniqueness: true
  validates :password_digest, presence: true
   #has_many :posts
   #has_many :subs
   #join table

  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(pass)
  end

  def ensure_session_token
    self.session_token ||= gen_session_token
  end
  def reset_session_token!
    self.session_token ||= gen_session_token
  end
 
  def gen_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end
  
  def self.find_by_credentials(uname,pass)
    @user = User.find_by(username: uname)
    return nil if @user.nil?
    if @user.is_password?(pass)
      return @user
    end
    return nil
  end

  def self.find_by_session_token(st)
    User.find_by(session_token: st)
  end



end
