class Api::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController


  # private

  # def sign_up_params
  #   params.permit(:name, :email, :password, :password_confirmation, :gender)
  # end

  #skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters

  #:sign_up or :sign_in or :account_update
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender])
  end
end
