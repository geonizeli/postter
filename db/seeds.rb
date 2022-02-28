User.find_or_create_by(username: 'admin')
xpto = User.find_or_create_by(username: 'xpto')
geonizeli = User.find_or_create_by(username: 'geonizeli')

UserFollow.find_or_create_by(follower_id: xpto.id, followed_id: geonizeli.id)
UserFollow.find_or_create_by(follower_id: geonizeli.id, followed_id: xpto.id)

first_post = Post.find_or_create_by(content: 'Hello World!', user_id: xpto.id)
Post.find_or_create_by(content: 'Hello World!', user_id: xpto.id, quoted_post_id: first_post.id)
Post.find_or_create_by(content: 'Hello World!', user_id: geonizeli.id)