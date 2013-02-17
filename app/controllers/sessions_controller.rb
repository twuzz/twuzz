class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:user] &&
       params[:user][:email] &&
       (user = User.find_by_email(params[:user][:email])) &&
       user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end
end
