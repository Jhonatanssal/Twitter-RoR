class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(tweet_id: params[:tweet_id])

    if @like.save
      redirect_to root_path, notice: 'You liked a tweet.'
    else
      redirect_to root_path, alert: 'You cannot like this tweet.'
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id], user: current_user, tweet_id: params[:tweet_id])
    if @like
      @like.destroy
      redirect_to root_path, notice: 'You disliked a tweet.'
    else
      redirect_to root_path, alert: 'You cannot dislike tweet that you did not like before.'
    end
  end
end
