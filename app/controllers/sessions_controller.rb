class SessionsController < Devise::SessionsController
  respond_to :html, :json

  protected
    def after_sign_in_path_for(resource)
      session[:return_to] || genres_path
    end
end
