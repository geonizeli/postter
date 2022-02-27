User.find_or_create_by(username: 'admin')
xpto = User.find_or_create_by(username: 'xpto')
geonizeli = User.find_or_create_by(username: 'geonizeli')

UserFollow.find_or_create_by(follower_id: xpto.id, followed_id: geonizeli.id)
UserFollow.find_or_create_by(follower_id: geonizeli.id, followed_id: xpto.id)
