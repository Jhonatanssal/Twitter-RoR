require 'rails_helper'

RSpec.describe "tweets/index", type: :view do
  before(:each) do
    assign(:tweets, [
      Tweet.create!(),
      Tweet.create!()
    ])
  end

  it "renders a list of tweets" do
    render
  end
end
