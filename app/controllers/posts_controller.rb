class PostsController < ApplicationController

  before_action :find_post, only: [:show]
  def index
    @posts = Post.all
  end

  def create
    # @post = current_user.posts.build(post_params)
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def show
  end

  private
  def find_post
    @post = Post.find(post_params[:post_id])
  end

  def post_params
    params.require(:post).permit(:content, :photo)
  end
end
