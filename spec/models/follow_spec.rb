require 'rails_helper'

RSpec.describe Follow, type: :model do
  User.delete_all
  Follow.delete_all
  let!(:user) { User.create(username: 'Test', fullname: 'Testing') }
  let!(:user1) { User.create(username: 'Test1', fullname: 'Testing follows') }
  let!(:valid_follow) { Follow.create(follower_id: user.id, followed_id: user1.id) }
  let!(:invalid_follow) { Follow.create(follower_id: user.id, followed_id: user1.id) }
  let!(:invalid_follow1) { Follow.create(follower_id: nil, followed_id: user1.id) }

  context 'Valid follow' do
    it 'checks if one user can follow other user' do
      expect(valid_follow).to be_valid
    end
  end

  context 'Invalid follow' do
    it 'does not allow repeated follows' do
      expect(invalid_follow).to be_invalid
    end

    it 'checks for the presence of follower id and followed user' do
      expect(invalid_follow1).to be_invalid
    end
  end
end
