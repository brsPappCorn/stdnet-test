class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Used to pass aditional parameters for devise signup
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      if user_params[:role_id].to_i == User::ROLE_ID[1]
        # Student Model
        user_params.permit(:email, :password, :password_confirmation, :role_id, :promo_id, :referenced_by,
                           student_attributes: [:university_id, :major_id])
      elsif user_params[:role_id].to_i == User::ROLE_ID[2]
        # Company
        user_params.permit(:email, :password, :password_confirmation, :role_id, :promo_id, :referenced_by,
                           company_attributes: [:company_name])
      elsif user_params[:role_id].to_i == User::ROLE_ID[3]
        # Person Model
        user_params.permit(:email, :password, :password_confirmation, :role_id, :promo_id, :referenced_by,
                           person_attributes: [:occupation])
      end
    end
  end



=begin
  protected
  # Devise redirection
  def after_sign_up_path_for(resource)
     admin_panel_path
  end
=end

  # TODO: Change devise redirections for depending on the role

=begin
  def after_sign_in_path_for(resource)
      if resource.role == "dealer"
        dashboard_dealer_path
      elsif resource.role == "admin"
        admin_dashboard_path
     else
       dashboard_customer_path
     end
  end
=end

end
