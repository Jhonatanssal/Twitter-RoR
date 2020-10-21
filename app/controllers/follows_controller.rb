# rubocop: disable Style/GuardClause

class FollowsController < ApplicationController
  def follow
    @user = User.find(params[:id])
    unless Follow.where(follower_id: current_user.id, followed_id: @user.id).exists?
      @follow = current_user.follows.create(followed_id: @user.id)
      redirect_to @user, notice: "#{@user.fullname} followed!"
    end
  end

  def unfollow
    @user = User.find(params[:id])
    @follow = Follow.find_by(follower_id: current_user.id, followed_id: @user.id)
    @follow.destroy
    redirect_to @user, notice: "#{@user.fullname} Unfollowed!"
  end
end

# rubocop: enable Style/GuardClause
