class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    if administrator_signed_in?
      @companies = Company.all.page params[:page]
    else
      redirect_to root_path
    end
  end

  def show
    if user_signed_in? || administrator_signed_in?
    else
      redirect_to root_path
    end
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        flash[:success] = 'La empresa fue creada exitosamente.'
        format.html { redirect_to @company }
      else
        flash[:error] = 'La empresa no pudo ser creada, por favor intentarlo nuevamente.'
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        flash[:success] = 'La empresa fue actualizada exitosamente.'
        format.html { redirect_to @company }
      else
        flash[:error] = 'La empresa no pudo ser actualizada, por favor intentarlo nuevamente.'
        format.html { render :edit }
      end
    end
  end

  def destroy
    if administrator_signed_in?
      @company.destroy
      respond_to do |format|
        flash[:success] = 'La empresa fue eliminada exitosamente.'
        format.html { redirect_to companies_url }
      end
    else
      redirect_to root_path
    end
  end

  private
  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:id, :company_name, :position, :company_address, :company_nit, :company_description, :company_size, :company_website_url, :company_sector_id)
  end
end
