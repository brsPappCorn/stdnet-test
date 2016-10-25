class Users::ConfirmationsController < Devise::ConfirmationsController
  # http://localhost:3000/confirmation?confirmation_token=ukJAq6wyyuAdT9Qx1jmb

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      set_flash_message!(:notice, :confirmed)
      sign_in(resource) # Automatic sign in
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
    else
      respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
    end
  end
end