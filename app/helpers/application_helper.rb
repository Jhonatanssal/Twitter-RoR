# rubocop: disable Layout/LineLength
# rubocop: disable Style/GuardClause

module ApplicationHelper
  def home_btn
    link_to('<i class="fab fa-twitter fa-2x"></i>'.html_safe, root_path, class: 'text-white pl-4 pt-1')
  end

  def nav_btns
    if current_user
      link_to('Log out', logout_path, class: 'text-light text-decoration-none btn btn-secondary')
    else
      link_to('Sign in', login_path, class: 'text-dark text-decoration-none btn btn-light') + link_to('Sign up', new_user_path, class: 'text-dark text-decoration-none btn btn-light')
    end
  end

  def profile_box
    render 'tweets/profile' if current_user
  end

  def check_main(tweet)
    like_or_dislike(tweet) if current_user
  end

  def like_or_dislike(tweet)
    like = Like.find_by(tweet: tweet, user: current_user)
    if like
      link_to('<i class="far fa-thumbs-down"></i>'.html_safe, tweet_like_path(id: like.id, tweet_id: tweet.id), method: :delete)
    else
      link_to('<i class="far fa-thumbs-up"></i>'.html_safe, tweet_likes_path(tweet_id: tweet.id), method: :post)
    end
  end

  def flash_notice
    if flash[:notice]
      raw("<div class='not notification is-primary global-notification float-right w-100'>
        <p class='notice'>#{notice}</p>
      </div>")
    end
  end

  def flash_alert
    if flash[:alert]
      raw("<div class='not notification is-danger global-notification float-right w-100'>
        <p class='alert'>#{alert}</p>
      </div>")
    end
  end
end

# rubocop: enable Layout/LineLength
# rubocop: enable Style/GuardClause
