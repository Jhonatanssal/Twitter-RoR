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
end
