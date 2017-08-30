class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :is_logged?



  def current_user
    User.find_by_session_token(session[:session_token])
  end
  
  def login!(user)
    user.reset_session_token!
    user.save
    session[:session_token] = user.session_token
  end
  
  def logout!
    @current_user = current_user
    @current_user.reset_session_token!
    @current_user.save!
    session[:session_token] = nil
  end
  
  def is_logged?
   !!current_user
  end
  
  def require_logged_in!
    redirect_to new_session_url unless is_logged?
  end
end
