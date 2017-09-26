class CompaniesController < ApplicationController
  before_action :set_company, only: :show

  def index
    if administrator_signed_in?
      @companies = Company.all.page params[:page]
    else
      redirect_to root_path
    end
  end

  def show
    if administrator_signed_in? || (user_signed_in? && current_user == @company.user)
      @notifications = NotificationPost.all
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
