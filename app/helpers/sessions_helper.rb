module SessionsHelper
  
  def sign_in user
    session[:id] = user.id
  end

  def remember user
    user.update(remember_token: User.new_token)
    cookies.permanent[:members_only_token] = user.remember_token
  end

end
