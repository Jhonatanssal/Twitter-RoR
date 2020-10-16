module UsersHelper
  def follow_unfollow
    if Follow.where(follower_id: current_user.id, followed_user_id: @user.id).exists?
      link_to('Unfollow', "/follow/#{@user.id}", method: 'delete', class: 'btn btn-danger')
    else
      link_to('Follow', "/follow/#{@user.id}", class: 'btn btn-primary')
    end
  end
end
