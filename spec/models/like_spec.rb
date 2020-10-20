require 'rails_helper'

RSpec.describe Like, type: :model do
  Like.delete_all
  let!(:user) { User.create(username: 'Test', fullname: 'Testing') }
  let!(:tweet) { Tweet.create(tweet: 'Testing specs', author_id: user.id) }
  let!(:valid_like) { Like.create(user_id: user.id, tweet_id: tweet.id) }
  let!(:invalid_like) { Like.create(user_id: user.id, tweet_id: tweet.id) }
  let!(:invalid_like1) { Like.create(user_id: nil, tweet_id: tweet.id) }

  context "Valid like" do
    it "checks for like uniqueness" do
      expect(valid_like).to be_valid
    end

    it "checks for presence of user_id and tweet_id" do
      expect(valid_like).to be_valid
    end 
  end

  context "Invalid like" do
    it "checks for like uniqueness" do
      expect(invalid_like).to be_invalid
    end

    it "checks for presence of user_id and tweet_id" do
      expect(invalid_like1).to be_invalid
    end  
  end  
end
