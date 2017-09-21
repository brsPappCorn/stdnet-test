json.extract! notification_post, :id, :name, :body, :user_id, :created_at, :updated_at
json.url notification_post_url(notification_post, format: :json)
