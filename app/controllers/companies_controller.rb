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
    # if params[:plan] == "executive"
    #   @amount = "70000"
    # elsif params[:plan] == "pro"
    #   @amount = "70000"
    # elsif params[:plan] == "premium"
    #   @amount = "70000"
    # end
    @plan = params[:plan]
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
    @product_description = @plan + " Plan"
    @currency = "USD"
    signature = @api_key + "~" + @merchant_id + "~" + @reference_code + "~" + @amount + "~" + @currency
    @signature = Digest::MD5.hexdigest(signature)
  end

  def payment_response_page
    if params[:transactionState] == "4" 
      @transaction_state = "APPROVED"
    elsif params[:transactionState] == "6"
      @transaction_state = "DECLINED"
    elsif params[:transactionState] == "104"
      @transaction_state = "ERROR"
    elsif params[:transactionState] == "5"
      @transaction_state = "EXPIRED"
    elsif params[:transactionState] == "7"
      @transaction_state = "PENDING"
    end
    transaction = Transaction.new
    transaction.transaction_state = params[:transactionState]
    transaction.plan = params[:extra1]
    transaction.reference_number = params[:referenceCode]
    transaction.pol_transaction_state = params[:polTransactionState]
    transaction.pol_response_code = params[:polResponseCode]
    transaction.description = params[:description]
    transaction.lap_response_code = params[:lapResponseCode]
    transaction.lap_transaction_state = params[:lapTransactionState]
    transaction.reference_code = params[:referenceCode]
    transaction.reference_pol = params[:reference_pol]
    transaction.transaction_id = params[:transactionId]
    transaction.lap_payment_method = params[:lapPaymentMethod]
    transaction.lap_payment_method_type = params[:lapPaymentMethodType]
    transaction.pse_bank = params[:pseBank]
    transaction.user_id = current_user.id
    transaction.amount = params[:TX_VALUE]
    transaction.save!
    if params[:extra1] == "executive"
      @credits = "5"
    elsif params[:extra1] == "pro"
      @credits = "10"
    elsif params[:extra1] == "premium"
      @credits = "unlimited"
    end
    current_user.credits = @credits
    current_user.save!
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
