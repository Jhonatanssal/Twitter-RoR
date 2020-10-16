require 'rails_helper'

RSpec.describe "tweets/show", type: :view do
  before(:each) do
    @tweet = assign(:tweet, Tweet.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
