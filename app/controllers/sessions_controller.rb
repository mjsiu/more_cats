class SessionsController < ApplicationController

  before_action :logged_in?, only: [:destroy]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      session_params[:user_name],
      session_params[:password]
    )

    if user
      login_user!(user)
      redirect_to cats_url
    else
      render :new
    end
  end

  def logged_in?
    redirect_to cats_url unless current_user
  end

  def destroy
    user = current_user
    user.reset_session_token! unless user
    session[:session_token] = nil
    redirect_to new_session_url
  end

  def session_params
    params.require(:session).permit(:user_name, :password)
  end

end
