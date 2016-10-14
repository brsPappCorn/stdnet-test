class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy, :apply, :application_form, :applicants, :approve]

  def index
    # Used to check what type of role is signed in
    @user_role = User.find_by_id(current_user.id)
    if @user_role.role_id == 2
      @all_opportunities = Opportunity.all
      @opportunities = Opportunity.opportunities_for_student(@user_role.student)

    elsif @user_role.role_id == 3 || @user_role.role_id == 3
      redirect_to my_opportunities_opportunities_path
    end

  end

  def show
    if user_signed_in?
    # Used to check what type of role is signed in
      @user_role = User.find_by_id(current_user.id)
    elsif administrator_signed_in?
      @user_role = Administrator.find_by_id(current_administrator.id)
    end

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
    if administrator_signed_in?
      @opportunity.destroy
      respond_to do |format|
        format.html { redirect_to opportunities_url, notice: 'Opportunity was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end

  #================
  # Custom Actions
  #================
  def my_opportunities
    # Used to check what type of role is signed in
    @user_role = User.find_by_id(current_user.id)

    # Used for companies/people that create opportunities
    @my_opportunities = Opportunity.where(user_id: [current_user.id])

    # Used for students that applied to opportunities
    @student_opportunities = @user_role.applied_opportunities
  end

  def applicants
    @applicants = @opportunity.applied_users
  end

  def application_form
    @application = @opportunity.applications.build
  end

  def apply
    application = @opportunity.applications.build user_id: current_user.id
    application.assign_attributes application_params

    if application.save
      flash[:error] = 'Aplicaste satisfactoriamente a la oferta'
      redirect_to opportunities_path
    else
      flash[:error] = 'Intentalo de nuevo'
      redirect_to @opportunity
    end

  end

  def approve
    if administrator_signed_in?
      @opportunity.approve
      # TODO: Flash exito
      redirect_to opportunities_administrators_path
    else
      redirect_to root_path
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_opportunity
    @opportunity = Opportunity.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def opportunity_params
    params.require(:opportunity).permit(:opportunity_type, :opportunity_title, :activity_description, :skills_description,
                                        :major_id, :other_majors, :question_for_student, :date_ini, :opportunity_duration,
                                        :availability, :cost_or_offer_option, :opportunity_cost, :receive_portfolio,
                                        :number_of_students, :user_id, :student_availability, :date_ini_type, :opportunity_duration_type
    )
  end

  def application_params
    params.require(:application).permit(
        :student_characteristics,
        :student_interests,
        :student_answer,
        :opportunity_value,
        :portfolio
    )
  end
end
