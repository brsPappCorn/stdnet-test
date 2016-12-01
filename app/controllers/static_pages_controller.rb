class StaticPagesController < ApplicationController
  include UsersHelper

  skip_before_filter :authenticate_user!

  def index
    if user_signed_in?
      redirect_to role_show_route(current_user)
    elsif administrator_signed_in?
      redirect_to opportunities_administrators_path
    end
  end

  def about
  end

end
