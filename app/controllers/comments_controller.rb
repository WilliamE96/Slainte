class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    @comment.created_at = Time.now

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
