class StaticPagesController < ApplicationController
  def index

    if user_signed_in?
      if current_user.role_id == 2
        redirect_to student_path(current_user.id)
      elsif current_user.role_id == 3
        redirect_to company_path(current_user.id)
      elsif current_user.role_id == 4
        redirect_to person_path(current_user.id)
      end
    elsif administrator_signed_in?
      redirect_to opportunities_administrators_path
    end

  end

  def about
  end

end
