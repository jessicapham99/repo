json.extract! user, :id, :username, :password, :fullname, :email, :phone_number, :gender, :address, :image, :birth, :role_id, :create_time, :created_at, :updated_at
json.url user_url(user, format: :json)
