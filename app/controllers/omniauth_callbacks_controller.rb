class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.from_omniauth(request.env["omniauth.auth"])
      if user.persisted?
        flash.notice = "Signed in Through Google!"
        sign_in_and_redirect user
      else
        session["devise.user_attributes"] = user.attributes
       flash.notice = "You are almost Done! Please provide a password to finish setting up your account, for in case you sign in separately next time with same email associated with this profile."
       redirect_to new_user_registration_url
    end
  end
  def facebook
    user = User.from_omniauth(request.env["omniauth.auth"])
      if user.persisted?
        flash.notice = "Signed in Through Facebook!"
        sign_in_and_redirect user
      else
        session["devise.user_attributes"] = user.attributes
       flash.notice = "You are almost Done! Please provide a password to finish setting up your account, for in case you sign in separately next time with same email associated with this profile."
       redirect_to new_user_registration_url
    end
  end
  # .... one for every method like twitter, facebook... etc
end

