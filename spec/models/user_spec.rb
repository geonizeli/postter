require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    describe 'username' do
      it 'presence' do
        user = build(:user, username: nil)

        expect(user).to_not be_valid
      end

      it 'uniqueness' do
        create(:user, username: 'xpto')
        user = build(:user, username: 'xpto')

        expect(user).to_not be_valid
      end

      it 'max length 14' do
        with_15_caracters = build(:user, username: 'asdfghjklzxcvhn')
        with_14_caracters = build(:user, username: 'asdfghjklzxcvh')

        expect(with_15_caracters).to_not be_valid
        expect(with_14_caracters).to be_valid
      end

      it 'format' do
        with_invalid_format = build(:user, username: 'asdfghjklzxcvh!')
        with_valid_format = build(:user, username: 'asdfghjklzxcvh')

        expect(with_invalid_format).to_not be_valid
        expect(with_valid_format).to be_valid
      end
    end
  end

  context '#relations' do
    context 'following' do
      it do
        user1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)

        create(:user_follow, follower_id: user1.id, followed_id: user2.id)
        create(:user_follow, follower_id: user3.id, followed_id: user1.id)

        expect(user1.following).to eq([user2])
      end
    end

    context 'followers' do
      it do
        user1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)

        create(:user_follow, follower_id: user1.id, followed_id: user2.id)
        create(:user_follow, follower_id: user3.id, followed_id: user1.id)

        expect(user1.followers).to eq([user3])
      end
    end
  end
end
