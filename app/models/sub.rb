# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  moderator_id :integer          not null
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  description  :text
#

class Sub < ApplicationRecord
  validates :moderator_id, :title,presence: true

  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :User

  has_many :subpostjoins,
    primary_key: :id,
    foreign_key: :sub_id,
    class_name: :Subpostjoin,
    inverse_of: :sub

  has_many :posts,
    through: :subpostjoins,
    source:  :post

end
