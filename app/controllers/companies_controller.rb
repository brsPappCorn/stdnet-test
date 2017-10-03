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
  def payment_page
    @user = current_user
    @reference_code = rand(36**10).to_s(36)
    @account_id = "512321"
    @api_key = '4Vj8eK4rloUd272L48hsrarnUA'
    @merchant_id = '508029'
    @amount = "3"
    @address = current_user.company.company_address rescue ""
    @city = City.find(current_user.city) rescue "indore"
    @country = Country.find(current_user.country) rescue "india"
    @email = current_user.email
    @tax = 0
    @tax_return = 0
    @product_description = "Test PAYU"
    @currency = "USD"
    signature = @api_key + "~" + @merchant_id + "~" + @reference_code + "~" + @amount + "~" + @currency
    @signature = Digest::MD5.hexdigest(signature)
  end

  def payment_response_page
    if params[:transactionState] == "4"
      @transaction_state = "APPROVED"
    else
      @transaction_state = "FAILED"
    end
  end

  def payment_confirmation_page
  end

  private
  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:id, :company_name, :position, :company_address, :company_nit, :company_description, :company_size, :company_website_url, :company_sector_id)
  end
end
