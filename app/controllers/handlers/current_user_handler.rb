module CurrentUserHandler  
  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def require_current_user
    if current_user
      current_user
    else
      redirect_to login_url
    end
  end
end
