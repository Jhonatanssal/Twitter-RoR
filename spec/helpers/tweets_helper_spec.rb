require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TweetsHelper. For example:
#
# describe TweetsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TweetsHelper, type: :helper do
  User.delete_all
  Tweet.delete_all
  let!(:current_user) { User.create(username: 'test', fullname: 'testing') }
  let!(:tweet) { Tweet.create(tweet: 'Testing', user_id: current_user.id) }

  describe 'tweet form' do
    it 'renders the tweet form' do
      expect(helper.tweet_form).to render_template('tweets/form')
    end
  end
end
