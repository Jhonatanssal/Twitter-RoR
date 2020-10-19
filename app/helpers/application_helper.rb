module ApplicationHelper
  def nav_btns
    if current_user
      link_to('Profile', user_path(current_user), class: 'text-dark text-decoration-none btn btn-light') + link_to('Log out', logout_path, class: 'text-dark text-decoration-none btn btn-light')
    else
      link_to('Sign in', login_path, class: 'text-dark text-decoration-none btn btn-light') + link_to('Sign up', new_user_path, class: 'text-dark text-decoration-none btn btn-light')
    end
  end

  def profile_box
    if current_user
      render 'tweets/profile'
    end
  end

  def check_main(tweet)
    if current_user
      like_or_dislike(tweet)
    end
  end

  def like_or_dislike(tweet)
    like = Like.find_by(tweet: tweet, user: current_user)
    if like
      link_to("<i class=\"far fa-thumbs-down\"></i>".html_safe, tweet_like_path(id: like.id, tweet_id: tweet.id), method: :delete)
    else
      link_to("<i class=\"far fa-thumbs-up\"></i>".html_safe, tweet_likes_path(tweet_id: tweet.id), method: :post)
    end
  end
end
