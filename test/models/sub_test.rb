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

require 'test_helper'

class SubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
