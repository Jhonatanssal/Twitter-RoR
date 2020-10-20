require 'rails_helper'

RSpec.describe Comment, type: :model do
  Comment.delete_all
  User.delete_all
  Tweet.delete_all
  let!(:user) { User.create(username: 'Test', fullname: 'Testing') }
  let!(:tweet) { Tweet.create(tweet: 'Testing specs', user_id: user.id) }
  let!(:valid_comment) { Comment.create(content: 'Comment test', tweet_id: tweet.id, user_id: user.id) }
  let!(:invalid_comment) { Comment.create(content: nil, tweet_id: nil, user_id: nil) }
  let!(:invalid_comment1) { Comment.create(content: 'ab', tweet_id: tweet.id, user_id: user.id) }

  describe 'Create' do
    context 'Valid comment' do
      it 'checks if the comment belongs to an user' do
        expect(valid_comment.user).to eq(user)
      end

      it 'checks if the comment belongs to a tweet' do
        expect(valid_comment.tweet).to eq(tweet)
      end
    end

    context 'Invalid comment' do
      it 'checks if the invalid comment does not belong to an user' do
        expect(invalid_comment.user).not_to be true
      end

      it 'checks if the invalid comment does not belong to a tweet' do
        expect(invalid_comment.tweet).not_to be true
      end

      it 'checks if the comment cannot be create with less than 3 characteres' do
        expect(invalid_comment1).to be_invalid
      end
    end
  end
end
