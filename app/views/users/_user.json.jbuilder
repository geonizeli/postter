json.extract! user, :id, :username
json.joined_at user.created_at.strftime("%B %d, %Y")
json.following_count user.following.count
json.follower_count user.followers.count
json.posts_count user.posts.count

json.url user_url(user, format: :json)
