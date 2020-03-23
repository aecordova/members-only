class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
     sign_in user
     remember user
    end
  end


end
