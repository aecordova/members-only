class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
     sign_in user
     remember user

    end
  end

  def destroy
    sign_out current_user
    redirect_to login_path
  end


end
