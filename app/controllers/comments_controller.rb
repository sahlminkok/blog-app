class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author = User.find(params[:user_id])

    if @comment.save
      redirect_to user_post_path(current_user, @post), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    authorize! :destroy, @comment

    if @comment.destroy
      redirect_to user_post_path(@comment.author, @comment.post), notice: 'Comment was successfully deleted.'
    else
      redirect_to user_post_path(@comment.author, @comment.post), alert: 'Error: Comment could not be deleted'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
