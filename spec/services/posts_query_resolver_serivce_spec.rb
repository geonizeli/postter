require 'rails_helper'

RSpec.describe PostsQueryResolverService, type: :service do
  context '#call' do
    let(:current_user) { create(:user) }

    context 'when without filter' do
      it 'returns all posts' do
        followed_user = create(:user)
        create(:user_follow, follower_id: current_user.id, followed_id: followed_user.id)

        post1 = create(:post, user_id: followed_user.id)
        post2 = create(:post, user_id: followed_user.id)
        post3 = create(:post)

        expect(
          described_class.call({}, current_user)
        ).to eq([post1, post2, post3])
      end
    end

    context 'when scoping by user follows' do
      it 'returns only posts from user follows' do
        followed_user = create(:user)
        create(:user_follow, follower_id: current_user.id, followed_id: followed_user.id)

        post1 = create(:post, user_id: followed_user.id)
        post2 = create(:post, user_id: followed_user.id)
        post3 = create(:post)

        expect(
          described_class.call({ scope: 'follows' }, current_user)
        ).to eq([post1, post2])
      end
    end
  end
end