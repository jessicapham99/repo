json.extract! article, :id, :name, :category_id, :image, :descript, :create_time, :created_at, :updated_at
json.url article_url(article, format: :json)
