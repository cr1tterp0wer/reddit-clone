# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#

class Post < ApplicationRecord
  validates  :title, presence:true
 
  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :subpostjoins,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Subpostjoin,
    inverse_of: :post

  has_many :subs,
    through: :subpostjoins,
    source: :sub

end
