require 'rails_helper'
require 'follows_controller'

RSpec.describe LikesController, type: :controller do
  Like.delete_all

  let!(:user) { User.create(username: 'Test', fullname: 'Testing') }
  let!(:tweet) { Tweet.create(tweet: 'Testing tweet', user_id: user.id) }
  let!(:valid_like) { Like.create(user_id: user.id, tweet_id: tweet.id) }
  let!(:invalid_like) { Like.create(user_id: nil, tweet_id: tweet.id) }
  let!(:remove_like) { Like.create(user_id: user.id, tweet_id: tweet.id) }
  let!(:removed_invalid_like) { Like.create(user_id: nil, tweet_id: nil) }

  describe '#create' do
    context 'Valid like' do
      it 'checks if the like can be created' do
        expect(valid_like).to be_valid
      end

      it 'checks if the like can be created' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'Invalid like' do
      it 'checks if the like cannot be created' do
        expect(invalid_like).to be_invalid
      end
    end
  end

  describe '#destroy' do
    it 'removes the like if exists' do
      remove_like.delete
      expect(response).to have_http_status(:ok)
    end
  end
end
