module UsersHelper
  def follow_unfollow
    check if current_user
  end

  def check
    if Follow.where(follower_id: current_user.id, followed_user_id: @user.id).exists?
      link_to('Unfollow', "/follow/#{@user.id}", method: 'delete', class: 'btn btn-danger text-white')
    elsif current_user.id != @user.id
      link_to('follow', "/follow/#{@user.id}", class: 'btn btn-primary text-white')
    end
  end

  def edit_profile_btn
    @user = User.find(params[:id])

    link_to 'Edit', edit_user_path(@user) if current_user == @user.id
  end
end
