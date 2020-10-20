class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all.includes([:comments, :tweets, :likes, :followings, :followers])
  end

  def show
    @tweets = @user.tweets
    @tweets.each { |tweet| @comment = tweet.comments }
    if current_user
      @followed = current_user.followings
      @followers = current_user.followers
    end
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'User was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'User was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :fullname)
  end
end
