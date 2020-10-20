module UsersHelper
  def follow_unfollow
    check if current_user
  end

  def check
    if Follow.where(follower_id: current_user.id, followed_id: @user.id).exists?
      link_to('Unfollow', "/follow/#{@user.id}", method: 'delete', class: 'btn btn-danger text-white')
    elsif current_user.id != @user.id
      link_to('follow', "/follow/#{@user.id}", class: 'btn btn-primary text-white')
    end
  end

  def edit_profile_btn
    @user = User.find(params[:id])

    link_to 'Edit', edit_user_path(@user) if current_user == @user.id
  end

  def edit_tweet_btn(tweet)
    if tweet.user == current_user
      link_to edit_tweet_path(tweet), class: "level-item" do
        raw("<span class='icon'><i class='fas fa-pencil-alt'></i></span>")
      end
    end
  end

  def delete_tweet_btn(tweet)
    if tweet.user == current_user
      link_to tweet, method: :delete, data: { confirm: "Are you sure you want to delete this tweeet?" } do
        raw("<span class='icon'><i class='far fa-trash-alt'></i></span>")
      end
    end
  end

  def comments(tweet)
    unless @comment.empty?
      raw("<p><b>Comments:</b></p>
    
      <div class='border rounded p-2'>
        #{render partial: 'comments/comment', collection: tweet.comments}
      </div><br>")
    end
  end
end
