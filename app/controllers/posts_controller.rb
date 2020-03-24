class PostsController < ApplicationController
  before_action :signed_in_only, only: [:new, :create]
  
  def new; end
  def index
    @posts = Post.all
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created Successfully"
      redirect_to posts_path
    end
  end

  def signed_in_only
    return if signed_in?
    flash[:notice] = "Please sign in to perform such action"
    redirect_to login_path
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
