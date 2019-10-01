# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  username     :string           not null
#  password     :string           not null
#  fullname     :string           default(""), not null
#  email        :string           default(""), not null
#  phone_number :string           default(""), not null
#  gender       :boolean          not null
#  address      :string
#  image        :string           not null
#  birth        :date
#  role_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#



class User < ApplicationRecord

  has_many :articles
  has_many :comments
  belongs_to :role
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  self.table_name = "users"
end
