# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  descript          :string
#  user_id           :integer
#  article_id        :integer
#  create_time       :datetime
#  parent_comment_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
