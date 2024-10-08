class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.from_google(from_google_params)

    if user.present?
      sign_out_all_scopes
      flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
      redirect_to new_user_session_path
    end
  end

  def from_google_params
    @from_google_params ||= {
      first_name: auth.info.email.split('@').first,
      last_name: auth.info.email.split('@').first,
      uid: auth.uid,
      email: auth.info.email
    }
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
