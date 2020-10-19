require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  Comment.delete_all
  User.delete_all
  Tweet.delete_all
  let!(:user) { User.create(username: 'Test', fullname: 'Testing') }
  let!(:tweet) { Tweet.create(tweet: 'Testing specs', user_id: user.id) }
  let!(:valid_comment) { Comment.create(content: 'Comment test', tweet_id: tweet.id, user_id: user.id) }
  let!(:invalid_comment) { Comment.create(content: nil, tweet_id: tweet.id, user_id: user.id) }

  describe 'Create' do
    context 'Valid comment' do
      it 'checks if the comment can be created' do
        expect(valid_comment).to be_valid
      end

      it 'redirects to root if the comment can be created' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'Invalid comment' do
      it 'checks if the comment cannot be created' do
        expect(invalid_comment).to be_invalid
      end
    end
  end
end
