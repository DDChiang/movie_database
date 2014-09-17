module ApplicationHelper
  #redirect_back_or user
  def deny_acess
    store_location 
    redirect_to new_user_session_path
  end
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  private
    def store_location
      session[:return_to] = request.fullpath
    end
    def clear_return_to
      session[:return_to] = nil
    end
end

