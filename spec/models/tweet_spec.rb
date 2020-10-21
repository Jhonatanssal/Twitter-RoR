require 'rails_helper'

RSpec.describe Tweet, type: :model do
  Tweet.delete_all
  User.delete_all
  let!(:user) { User.create(username: 'Test', fullname: 'Testing') }
  let!(:valid_tweet) { Tweet.create(tweet: 'Testing tweet', author_id: user.id) }
  let!(:invalid_tweet) { Tweet.create(tweet: 'Testing tweet1', author_id: nil) }
  let!(:invalid_tweet1) { Tweet.create(tweet: 'T1', author_id: nil) }

  context 'Valid tweet' do
    it 'validates presence of user_id and tweet length' do
      expect(valid_tweet).to be_valid
    end
  end

  context 'Invalid tweet' do
    it 'validates presence of user_id' do
      expect(invalid_tweet).to be_invalid
    end

    it 'validates length of the tweet' do
      expect(invalid_tweet1).to be_invalid
    end
  end
end
