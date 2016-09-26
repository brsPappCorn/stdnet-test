class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    # Extending Devise controller to build nested form inside the User form_for
    super
  end

  def create
    # Extending Devise controller to build nested form inside the User form_for
    super
  end

# def edit
#   super
# end

# def update
#   super
# end

# def destroy
#   super
# end

# GET /resource/cancel
# Forces the session data which is usually expired after sign
# in to be expired now. This is useful if the user wants to
# cancel oauth signing in/up in the middle of the process,
# removing all OAuth session data.
# def cancel
#   super
# end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  #  def configure_sign_up_params
  # devise_parameter_sanitizer.permit(:sign_up, keys: [company: [:company_name] ])
  # params.require(:resource).permit( company: [ :company_name] )
  #  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # TODO: Change Devise after sign up redirection. Must redirect to '/info_basica' info_basica_path
   #The path used after sign up.
   def after_sign_up_path_for(resource)
     basic_info_user_path(resource.id)
   end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
