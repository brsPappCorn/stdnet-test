class AdministratorsController < ApplicationController
  before_action :set_administrator, only: [:show, :edit, :update, :destroy]



  def index
    @administrators = Administrator.all
  end

  def show
  end

  def new
    @administrator = Administrator.new
  end

  def edit
  end

  def create
    @administrator = Administrator.new(administrator_params)

    respond_to do |format|
      if @administrator.save
        flash[:success] = 'El administrador fue creado exitosamente.'
        format.html { redirect_to @administrator }
      else
        flash[:error] = 'El administrador no pudo ser creado, por favor intentarlo nuevamente.'
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @administrator.update(administrator_params)
        flash[:success] = 'El administrador fue actualizado exitosamente.'
        format.html { redirect_to @administrator }
      else
        flash[:error] = 'El administrador no pudo ser actualizado, por favor intentarlo nuevamente.'
        format.html { render :edit }
      end
    end
  end

  def destroy
    @administrator.destroy
    respond_to do |format|
      flash[:success] = 'El administrador fue eliminada exitosamente.'
      format.html { redirect_to administrators_url }
    end
  end

  #===================
  # Custom actions
  #===================

  def opportunities
    @opportunities = Opportunity.all
  end

  def pending_opportunities
    @opportunities = Opportunity.pending_approval
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrator
      @administrator = Administrator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administrator_params
      params.require(:administrator).permit(:name)
    end
end
