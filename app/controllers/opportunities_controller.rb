class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy, :apply]

  def index
    @opportunities = Opportunity.all
  end

  def show
  end

  def new
    @opportunity = Opportunity.new
  end

  def edit
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)

    respond_to do |format|
      if @opportunity.save
        format.html { redirect_to my_opportunities_opportunities_path, notice: 'Opportunity was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @opportunity.update(opportunity_params)
        format.html { redirect_to @opportunity, notice: 'Opportunity was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @opportunity.destroy
    respond_to do |format|
      format.html { redirect_to opportunities_url, notice: 'Opportunity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #================
  # Custom Actions
  #================
  def apply
    if @opportunity.users.push(current_user)
      flash[:error] = 'Aplicaste satisfactoriamente a la oferta'
      redirect_to opportunities_path
    else
      flash[:error] = 'Intentalo de nuevo'
      redirect_to @opportunity
    end

  end

  def my_opportunities
    @my_opportunities = Opportunity.where(user_id: [current_user.id])
  end

  def applicants
    current_opportunity = Opportunity.find_by_id(params[:id])
    @applicants = current_opportunity.users
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity
      @opportunity = Opportunity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opportunity_params
      params.require(:opportunity).permit(:opportunity_type, :opportunity_title, :activity_description, :skills_description, :major_id, :other_majors, :question_for_student, :date_ini, :opportunity_duration, :availability, :cost_or_offer_option, :opportunity_cost, :receive_portfolio, :number_of_students, :user_id)
    end
end
