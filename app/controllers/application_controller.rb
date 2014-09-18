class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #[1]should forward back to page when destroying something
  #[2]should forward back when press back button
  def store_location2
    session[:return_to2] = request.fullpath
  end
  def clear_return_to2
    session[:return_to2] = nil
  end
  def store_location 
    session[:return_to] = request.fullpath
  end
  def clear_return_to
    session[:return_to] = nil
  end
  def deny_access
    store_location
    redirect_to new_user_session_path
  end
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end
  def authenticate
    deny_access unless user_signed_in?
  end

end
