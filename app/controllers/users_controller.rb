class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if params[:id] =~ /^\d+$/
      @user = User.find(params[:id])
    else
      # Handle the case when 'id' is not a valid numeric value
      flash[:error] = 'Invalid user ID'
      redirect_to root_path
    end
  end
end
