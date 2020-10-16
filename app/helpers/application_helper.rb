module ApplicationHelper

  def nav_btns
    if current_user
      link_to('Profile', user_path(current_user), class: 'text-white text-decoration-none') + link_to('Log out', logout_path, class: 'text-white text-decoration-none')
    else
      link_to('Sign in', login_path, class: 'text-white text-decoration-none') + 'or' + link_to('Sign up', new_user_path, class: 'text-white text-decoration-none')
    end
  end

  def profile_box
    if current_user
      render 'tweets/profile'
    end
  end
end
