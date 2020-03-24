module SessionsHelper
  
  def sign_in(user)
    session[:id] = user.id
    current_user user
  end

  def sign_out(user)
    if user
      session[:id] = nil
      cookies.delete :members_only_token
    end
  end

  def remember(user)
    user.update(remember_token: User.new_token)
    cookies.permanent[:members_only_token] = user.remember_token
  end

  def signed_in?
    !current_user.nil?
  end

  # if passed a user, it will set it to current user, if no params, it will return the 
  # current user or nil if it doesnt exist
  def current_user(user=nil)
    @current_user = user unless user.nil?
    return nil unless session[:id] || cookies.permanent[:members_only_token] || @current_user
    
    @current_user ||= User.find(session[:id]) || User.find_by(remember_token: cookies.permanent[:members_only_token]) 
    
  end

end
