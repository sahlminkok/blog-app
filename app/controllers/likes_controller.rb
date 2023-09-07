class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = current_user.likes.new(post: @post)

    if @like.save
      redirect_to user_post_path(current_user, @post)
    else
      redirect_to user_post_path(current_user, @post), alert: 'Failed to like the post.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
