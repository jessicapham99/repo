# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  address              :string
#  birth                :date
#  create_time          :datetime
#  email                :string           default(""), not null
#  encrypted_password   :string
#  fullname             :string           default(""), not null
#  gender               :boolean          not null
#  image                :string
#  phone_number         :string           default(""), not null
#  reset_password_token :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  role_id              :integer
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord

  has_and_belongs_to_many :articles
  has_many :comments
  belongs_to :role
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  self.table_name = "users"
end
