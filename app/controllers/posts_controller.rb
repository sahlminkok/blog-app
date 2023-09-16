class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    authorize! :create, @post

    if @post.save
      redirect_to user_posts_path(current_user), notice: 'Post created successfully!'
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments).find_by(id: params[:id])
    authorize! :destroy, @post

    if @post.destroy
      redirect_to user_posts_path(@user), notice: 'Post deleted successfully!'
    else
      redirect_to user_posts_path(@user), alert: 'Error: Post could not be deleted'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
