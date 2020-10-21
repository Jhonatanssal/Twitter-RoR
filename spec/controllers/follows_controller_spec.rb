require 'rails_helper'

RSpec.describe FollowsController, type: :controller do
  Follow.delete_all

  let!(:user) { User.create(username: 'Test', fullname: 'Testing') }
  let!(:user1) { User.create(username: 'Test1', fullname: 'Testing1') }
  let!(:valid_follow) { Follow.create(follower_id: user.id, followed_id: user1.id) }
  let!(:invalid_follow) { Follow.create(follower_id: nil, followed_id: nil) }

  describe '#follow' do
    context 'Valid follow' do
      it 'checks if the comment can be created' do
        expect(valid_follow).to be_valid
      end

      it 'checks if the comment can be created' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'Invalid comment' do
      it 'checks if the comment cannot be created' do
        expect(invalid_follow).to be_invalid
      end
    end
  end
end
