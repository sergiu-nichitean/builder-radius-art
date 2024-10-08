# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def solana_auth
    wallet_address = params[:wallet_address]

    if verify_signature(wallet_address, params[:message], params[:signature])
      user = User.find_by(wallet_address: wallet_address)

      unless user
        user = User.create(
          wallet_address: wallet_address,
          first_name: wallet_address,
          last_name: wallet_address,
          email: "#{wallet_address}@radius.art",
          confirmed_at: Time.now
        )
      end

      sign_in(user)
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def verify_signature(wallet_address, message, signature)
    # TODO: verify this in a real way :)

    begin
      Base58.base58_to_int(wallet_address)
      Base58.base58_to_int(message)
      Base58.base58_to_int(signature)

      true
    rescue
      false
    end
  end
end
