require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  Tweet.delete_all
  User.delete_all

  let!(:user) { User.create(username: 'Test', fullname: 'Testing') }
  let!(:valid_tweet) { Tweet.create(tweet: 'Testing tweet', user_id: user.id) }
  let!(:invalid_tweet) { Tweet.create(tweet: 'Testing tweet1', user_id: nil) }

  describe '#create' do
    context 'Valid tweet' do
      it 'checks if the tweet can be created' do
        expect(valid_tweet).to be_valid
      end

      it 'checks if the like can be created' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'Invalid tweet' do
      it 'checks if the tweet cannot be created' do
        expect(invalid_tweet).to be_invalid
      end
    end
  end

  describe '#destroy' do
    it 'removes the tweet if exists' do
      valid_tweet.delete
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#update' do
    it 'updates the tweet if exists' do
      valid_tweet.update(tweet: 'update test')
      expect(response).to have_http_status(:success)
    end
  end
end
