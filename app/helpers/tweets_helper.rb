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

end
