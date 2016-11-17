class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :build_learnt_language, :mark_as_selected, :rate_opportunity]

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

  def build_learnt_language
  end

  def mark_as_selected
    if administrator_signed_in?
      application = @user.application_for_opportunity params[:opportunity]

      if application.mark_as_selected
        flash[:success] = "Ha marcado a #{@user.first_name} como el seleccionado para esta oferta."
      else
        flash[:error] = 'Ha ocurrido un error, por favor inténtelo de nuevo.'
      end

      redirect_to applicants_opportunity_path(params[:opportunity])
    else
      redirect_to root_path
    end
  end

  def rate_opportunity
    if administrator_signed_in?
      application = @user.application_for_opportunity params[:opportunity]

      if application.rate(params[:rating])
        flash[:success] = "Se ha calificado a #{@user.first_name} con #{params[:rating]}."
      else
        flash[:error] = 'Ha ocurrido un error, por favor inténtelo de nuevo.'
      end

      redirect_to applicants_opportunity_path(params[:opportunity])
    else
      redirect_to root_path
    end
  end

  private
  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :date_of_birth, :document_number, :mobile_phone, :city_id,
                                 :country_id, :university_id, :major_id, :referenced_by, :avatar, :other_city,
                                 student_attributes: [
                                     :id, :university_id, :major_id, :ed_level_id, :last_semester, :gpa, :gpa_max, :type_of_student,
                                     :exchange_student, :country_id, :exchange_university, :highschool, :work_xp,
                                     :xp_company, :xp_position, :xp_achievements, :volunteer_xp, :volunteer_org,
                                     :volunteer_functions, :language_id, :language_level, :programming_skills,
                                     :programing_languages, :strengths, :areas_to_develop, :hobbies, :student_availability,
                                     :other_tools_skills, :avatar, :other_major, :other_university, :second_university_id,
                                     :second_major_id, :second_ed_level_id, :second_xp_company, :second_xp_position,
                                     :second_xp_achievements, :third_xp_company, :third_xp_position, :third_xp_achievements,
                                     :second_volunteer_org, :second_volunteer_functions, :third_volunteer_org, :third_volunteer_functions,
                                     :second_other_major, :second_other_university,
                                     tool_ids:[],
                                     major_ids: [],
                                     learnt_languages_attributes: [
                                         :language_id, :language_level, :id
                                     ]
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