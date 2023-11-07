class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
  end
end