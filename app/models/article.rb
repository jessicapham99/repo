# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#  image       :string
#  descript    :string
#  create_time :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Article < ApplicationRecord
  has_many :comments
  has_many :users
  belongs_to :category

  mount_uploader :image, ImageUploader
end
