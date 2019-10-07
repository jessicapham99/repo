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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
