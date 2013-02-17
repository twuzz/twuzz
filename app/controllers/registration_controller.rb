class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    if params[:user]
      @user.email                 = params[:user][:email]                 unless params[:user][:email].blank?
      @user.password              = params[:user][:password]              unless params[:user][:password].blank?
      @user.password_confirmation = params[:user][:password_confirmation] unless params[:user][:password_confirmation].blank?
      @user.first_name            = params[:user][:first_name]            unless params[:user][:first_name].blank?
      @user.last_name             = params[:user][:last_name]             unless params[:user][:last_name].blank?
    end
    begin
      @user.save!
      session[:user_id] = @user.id
      redirect_to '/'
    rescue ActiveRecord::RecordInvalid => exception
      @exception = exception
      render :new
    end
  end
end
