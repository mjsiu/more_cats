class UsersController < ApplicationController

  before_action :logged_in?

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def logged_in?
    redirect_to cats_url if current_user
  end

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
