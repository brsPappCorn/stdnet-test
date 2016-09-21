class AdministratorsController < ApplicationController
  # before_action :set_administrator todo: Administrator Model - check these lines
  # authorize_resource

  def index
    @administrators = Administrator.all
  end





  private
  def set_administrator
    @administrator = Administrator.find(params[:id])
  end

  def administrator_params
    params.require(:administrator).permit(:name)
  end


end
