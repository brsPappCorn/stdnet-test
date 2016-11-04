class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    if administrator_signed_in?
      @users = User.all
    else
      redirect_to root_path
    end
  end

  def show
    redirect_to root_path
  end

  def edit
    @user = User.find_by_id(current_user.id)
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        flash[:success] = 'Tu perfil fue creado exitosamente.'
        format.html { redirect_to @user }
      else
        flash[:error] = 'Tu perfil no pudo ser creado, por favor inténtalo nuevamente.'
        format.html { render :new }
      end
    end
  end

  def update
    @user = User.find_by_id(current_user.id)

    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = 'Tu perfil se ha actualizado exitosamente.'
        format.html { redirect_to root_path }
      else
        flash[:error] = 'Tu perfil no pudo ser actualizado, por favor inténtalo nuevamente.'
        format.html { render :edit }
      end
    end
  end

  def destroy
    if administrator_signed_in?
      @user.destroy
      respond_to do |format|
        flash[:success] = 'Tu perfil fue eliminado exitosamente.'
        format.html { redirect_to users_url }
      end
    else
      flash[:error] = 'Tu perfil no pudo ser eliminado, por favor inténtalo nuevamente.'
      redirect_to root_path
    end
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
                                 :country_id, :university_id, :major_id, :referenced_by, :avatar, :other_city,
                                 student_attributes: [
                                     :id, :university_id, :major_id, :ed_level_id, :last_semester, :gpa, :gpa_max, :type_of_student,
                                     :exchange_student, :country_id, :exchange_university, :highschool, :work_xp,
                                     :xp_company, :xp_position, :xp_achievements, :volunteer_xp, :volunteer_org,
                                     :volunteer_functions, :language_id, :language_level, :programming_skills,
                                     :programing_languages, :strengths, :areas_to_develop, :hobbies, :student_availability,
                                     :other_tools_skills, :avatar, :other_major, :other_university, :second_university_id,
                                     :second_major_id, :second_ed_level_id,
                                     tool_ids:[],
                                     major_ids: []
                                 ],
                                 company_attributes: [
                                     :id, :position, :company_address, :company_nit, :company_description, :company_size,
                                     :company_website_url, :company_name, :company_sector_id
                                 ],
                                 person_attributes: [
                                     :id, :occupation, :profession
                                 ],
                                 opportunity_ids:[]

    )
  end
end