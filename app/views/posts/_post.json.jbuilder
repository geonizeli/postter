json.extract! post, :id, :content, :created_at

json.quoted_post(post.quoted_post, partial: 'posts/quoted_post', as: :post) if post.quoted_post
json.user(post.user, partial: 'posts/user', as: :user)

json.url post_url(post, format: :json)