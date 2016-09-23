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


=begin
 @resource = []
    @resource = User.new(params[:sign_up_params])

    hidden_role_id = params[:user][:role_id]
    puts '-------------->'
    puts 'hidden_role_id'
    puts hidden_role_id

    # Compares value for role_id passed on the hidden_field in order to build the nested form corresponding to the user role
    if hidden_role_id == User::ROLE_ID[1]
      puts '-------------->'
      puts 'is a student'
      @student = @resource.build_student if @resource.student.nil?
    elsif hidden_role_id == User::ROLE_ID[2]
      puts '-------------->'
      puts 'is a company'
      @company = @resource.build_company if @resource.company.nil?
    elsif hidden_role_id == User::ROLE_ID[3]
      puts '-------------->'
      puts 'is a person'
      @person = @resource.build_person if @resource.person.nil?
    end
=end

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

=begin
  hidden_role_id = params[:user][:hidden_role_id]

  puts '-------------->'
  puts 'hidden_role_id'
  puts hidden_role_id

  if hidden_role_id == 2
    puts '-------------->'
    puts 'is a student'
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :role_id, :promo_id, :referenced_by,
                         student_attributes: [:university_id, :major_id])
    end
  elsif hidden_role_id == 3
    puts '-------------->'
    puts 'is a company'
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :role_id, :promo_id, :referenced_by,
                         company_attributes: [:company_name])
    end
  elsif hidden_role_id == 4
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :role_id, :promo_id, :referenced_by,
                         person_attributes: [:occupation])
    end
  end
=end

=begin
# Student Model
  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    user_params.permit(:email, :password, :password_confirmation, :role_id, :promo_id, :referenced_by,
                       student_attributes: [:university_id, :major_id])
  end

# Company
  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    user_params.permit(:email, :password, :password_confirmation, :role_id, :promo_id, :referenced_by,
                       company_attributes: [:company_name])
  end

# Person Model
  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    user_params.permit(:email, :password, :password_confirmation, :role_id, :promo_id, :referenced_by,
                       person_attributes: [:occupation])
  end
=end


  # If you have extra params to permit, append them to the sanitizer.
  #  def configure_sign_up_params
  # devise_parameter_sanitizer.permit(:sign_up, keys: [company: [:company_name] ])
  # params.require(:resource).permit( company: [ :company_name] )
  #  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
