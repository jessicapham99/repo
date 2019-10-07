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
  paginates_per 25
  max_paginates_per 100
  has_many :comments
  has_and_belongs_to_many :users
  belongs_to :category

  mount_uploader :image, ImageUploader


  # def self.search(search, id)
  #   if search
  #     where(['name LIKE ?', "%#{search}%"])
  #   else
  #
  #   end
  # end
end
