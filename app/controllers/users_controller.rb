class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :basic_info]

  def index
    if administrator_signed_in?
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by_id(current_user.id)
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # TODO: BASIC INFO fix redirection. It's pointing to users/id instead of student || company || person
  def update
    @user = User.find_by_id(current_user.id)

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if administrator_signed_in?
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end

  # ===================
  # Custom Actions
  # ===================

  # Updates student basic info needed to show info in the student profile. Is the next step after devise(User) sign up.
  def basic_info
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
   # @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    #params.fetch(:user, {})
    params.require(:user).permit(:first_name, :last_name, :date_of_birth, :document_number, :mobile_phone, :city_id,
                                 :country_id, :university_id, :major_id, :referenced_by,
                                 student_attributes: [
                                     :id, :university_id, :major_id, :ed_level_id, :last_semester, :gpa, :gpa_max,
                                     :exchange_student, :country_id, :exchange_university, :highschool, :work_xp,
                                     :xp_company, :xp_position, :xp_achievements, :volunteer_xp, :volunteer_org,
                                     :volunteer_functions, :language_id, :language_level, :programming_skills,
                                     :programing_languages, :strengths, :areas_to_develop, :hobbies, :student_availability,
                                     tool_ids:[]
                                 ],
                                 company_attributes: [
                                     :id, :position, :company_address, :company_nit, :company_description, :company_size,
                                     :company_website_url, :company_name, :company_sector_id
                                 ],
                                 opportunity_ids:[]

    )
  end
end