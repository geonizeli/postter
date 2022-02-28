json.extract! post, :id, :content, :created_at
json.user(post.user, partial: 'posts/user', as: :user)
