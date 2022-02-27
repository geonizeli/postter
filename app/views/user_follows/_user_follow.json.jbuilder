json.extract! user_follow, :id, :follower_id, :followed_id, :created_at, :updated_at
json.url user_follow_url(user_follow, format: :json)
