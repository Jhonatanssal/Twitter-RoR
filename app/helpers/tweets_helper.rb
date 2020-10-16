module TweetsHelper
  def tweet_form
    if current_user
      render 'tweet_form'
    else
      'Log In or Sing Up to tweet!'
    end
  end

  def com_form(tweet)
    form_for(tweet.comments.new, url: tweet_comments_path(tweet)) do |form|
     form.text_field(:content, id: :comment_content, class: 'form-control mb-2', placeholder: 'Add new Comment') + form.submit('Add Comment', class: 'btn btn-primary')
    end
  end

  def comments_form(tweet)
    if current_user
      com_form(tweet)
    else
      'Sign in or Sign Up to comment!'
    end
  end

  def edit_btn(tweet)
    if tweet.user == current_user
      render partial: 'edit_btn'
    end
  end

  def follow_unfollow_check(user)
    if current_user
      follow_unfollow_main(user)
    end
  end

  def follow_unfollow_main(user)
    if Follow.where(follower_id: current_user.id, followed_user_id: user.id).exists?
      link_to('Unfollow', "/follow/#{user.id}", method: 'delete', class: 'btn btn-danger text-white')
    elsif current_user.id != user.id
      link_to('Follow', "/follow/#{user.id}", class: 'btn btn-primary text-white')
    end
  end

  def users_lists
    if current_user
      render 'users_not_followed'
    else
      render 'users_list'
    end
  end

end
