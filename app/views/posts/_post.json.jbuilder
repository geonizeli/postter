json.extract! post, :id, :content, :created_at, :updated_at

json.quoted_post(post.quoted_post, partial: 'posts/post', as: :post) if post.quoted_post
json.user(post.user, partial: 'users/user', as: :user) if post.user

json.url post_url(post, format: :json)