require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  Tweet.delete_all
  User.delete_all

  let!(:user) { User.create(username: 'Test', fullname: 'Testing') }
  let!(:valid_tweet) { Tweet.create(tweet: 'Testing tweet', author_id: user.id) }
  let!(:invalid_tweet) { Tweet.create(tweet: 'Testing tweet1', author_id: nil) }

  describe '#create' do
    context 'Valid tweet' do
      it 'checks if the tweet can be created' do
        expect(valid_tweet).to be_valid
      end

      it 'creates the tweet if valid' do
        expect { Tweet.create(tweet: 'Testing tweet', author_id: user.id) }.to change(Tweet, :count).by(+1)
      end

      it 'checks if the tweet can be created' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'Invalid tweet' do
      it 'checks if the tweet cannot be created' do
        expect(invalid_tweet).to be_invalid
      end

      it 'does not create the tweet if invalid' do
        expect { Tweet.create(tweet: 'Testing tweet1', author_id: nil) }.not_to change(Tweet, :count)
      end
    end
  end

  describe '#destroy' do
    it 'removes the tweet if exists' do
      expect { valid_tweet.delete }.to change(Tweet, :count).by(-1)
      expect(response).to have_http_status(:ok)
    end

    it 'removes the tweet if exists' do
      expect { invalid_tweet.delete }.not_to change(Tweet, :count)
    end
  end

  describe '#update' do
    it 'updates the tweet if exists' do
      invalid_tweet.update(author_id: user.id)
      expect(invalid_tweet).to be_valid
      expect(response).to have_http_status(:success)
    end
  end
end
