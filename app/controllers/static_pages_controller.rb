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
    # @plan = params[:plan]
    @user = current_user
    @number_of_days_left = 30-(Time.now - current_user.transactions.order("created_at DESC").first.created_at.to_time).to_i/(24 * 60 * 60)
    @user_credits = @user.credits
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
    # @product_description = @plan + " Plan"
    @currency = "USD"
    signature = @api_key + "~" + @merchant_id + "~" + @reference_code + "~" + @amount + "~" + @currency
    @signature = Digest::MD5.hexdigest(signature)
  end

end
