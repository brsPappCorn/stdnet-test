class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  # Devise redirection
  def after_sign_up_path_for(resource)
     admin_panel_path
  end

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
