json.extract! comment, :id, :descript, :user_id, :article_id, :create_time, :parent_comment_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
