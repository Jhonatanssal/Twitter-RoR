module UsersHelper
  def follow_unfollow
    if current_user
      check
    end
  end

  def check
    if Follow.where(follower_id: current_user.id, followed_user_id: @user.id).exists?
      link_to('Unfollow', "/follow/#{@user.id}", method: 'delete', class: 'btn btn-danger')
    elsif  current_user.id != @user.id
      link_to('follow', "/follow/#{@user.id}", method: 'delete', class: 'btn btn-danger')
    else
    end
  end

  def edit_profile_btn
    @user = User.find(params[:id])

    if current_user == @user.id
      link_to 'Edit', edit_user_path(@user)
    end
  end
end
