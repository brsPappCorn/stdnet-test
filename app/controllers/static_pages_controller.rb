class StaticPagesController < ApplicationController
  include UsersHelper

  def index
    if user_signed_in?
      redirect_to role_show_route(current_user)
    elsif administrator_signed_in?
      redirect_to opportunities_administrators_path
    end
  end

  def about
  end

  def pricing
    
  end

end
