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

class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_and_belongs_to_many :comment
end
