class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # protect_from_forgery with: :exception TODO: Review this exception. Authenticity token
  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :profile_incomplete

  protected
  # Used to pass aditional parameters for devise signup
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      if user_params[:role_id].to_i == User::ROLE_STUDENT
        # Student Model
        user_params.permit(:email, :password, :password_confirmation, :role_id, :promo_id, :referenced_by,
                           student_attributes: [:university_id, :major_id])
      elsif user_params[:role_id].to_i == User::ROLE_COMPANY
        # Company
        user_params.permit(:email, :password, :password_confirmation, :role_id, :promo_id, :referenced_by,
                           company_attributes: [:company_name])
      elsif user_params[:role_id].to_i == User::ROLE_PERSON
        # Person Model
        user_params.permit(:email, :password, :password_confirmation, :role_id, :promo_id, :referenced_by,
                           person_attributes: [:occupation])
      end
    end
  end

  private
  def profile_incomplete
    if user_signed_in? && current_user.profile_incomplete?
      if current_user.role_id == User::ROLE_STUDENT
        flash.now[:warning] = 'Recuerda que debes completar tu perfil para poder aplicar a las ofertas.'
      elsif current_user.role_id == User::ROLE_COMPANY || current_user.role_id == User::ROLE_PERSON
        flash.now[:warning] = 'Por favor completa la información de tu perfil para crear y publicar ofertas.'
      else
        flash.now[:warning] = 'Recuerda que debes completar tu perfil.'
      end
    end
  end
end


