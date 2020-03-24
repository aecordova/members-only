class PostsController < ApplicationController
  before_action :signed_in_only, on: [:new, :create]
  
  def new; end
  
  def create
    @post =  


  end

  def signed_in_only
    return if signed_in?
    redirect_to login_path
    flash[:notice] = "Please sign in to perform such action"
  end

end
