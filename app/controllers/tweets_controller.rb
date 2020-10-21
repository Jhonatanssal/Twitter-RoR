# rubocop: disable Style/GuardClause

class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show edit update destroy]
  before_action :user_login, except: %I[index show]

  def index
    @tweets = Tweet.all.order('created_at DESC').includes(%i[user comments])
    @users = User.order('created_at DESC').includes(%i[followings followers comments])
    @comments = Comment.all.includes(%i[user tweet])
    if current_user
      @tweet = current_user.tweets.new
      @not_followed = User.all.order('created_at DESC') - current_user.followings
      @not_followed.delete(current_user)
    end
  end

  def show; end

  def new
    @tweet = current_user.tweets.new
  end

  def edit; end

  def create
    @tweet = current_user.tweets.create(tweet_params)

    if @tweet.save
      redirect_to root_path, notice: 'Tweet was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to root_path, notice: 'Tweet was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_url, notice: 'Tweet was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tweet_params
    params.require(:tweet).permit(:tweet)
  end

  def user_login
    redirect_to login_path if current_user.nil?
  end
end

# rubocop: enable Style/GuardClause
