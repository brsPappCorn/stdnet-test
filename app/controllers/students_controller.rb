class StudentsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    if administrator_signed_in?
      @students = Student.all
    else
      redirect_to root_path
    end
  end

  def show
    if user_signed_in? || administrator_signed_in?
      if params[:opportunity]
        user_id = params[:id]
        opportunity_id = params[:opportunity]
        @application = Application.where(user_id: user_id, opportunity_id: opportunity_id).first
      end
    else
      redirect_to root_path
    end
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        flash[:success] = 'El estudiante fue creado exitosamente.'
        format.html { redirect_to root_path }
      else
        flash[:error] = 'El estudiante no pudo ser creado, por favor intentarlo nuevamente.'
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        flash[:success] = 'El estudiante fue actualizado exitosamente.'
        format.html { redirect_to root_path }
      else
        flash[:error] = 'El estudiante no pudo ser actualizado, por favor intentarlo nuevamente.'
        format.html { render :edit }
      end
    end
  end

  def destroy
    if administrator_signed_in?
      @student.destroy
      respond_to do |format|
        flash[:success] = 'El estudiante fue eliminado exitosamente.'
        format.html { redirect_to students_url }
      end
    else
      flash[:error] = 'El estudiante no pudo ser eliminado, por favor intentarlo nuevamente.'
      redirect_to root_path
    end
  end

  private
  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:id, :university_id, :major_id, :referenced_by, :ed_level_id, :last_semester, :gpa,
                                    :gpa_max, :type_of_student, :exchange_student, :country_id, :exchange_university,
                                    :highschool, :work_xp, :xp_company, :xp_position, :xp_achievements, :volunteer_xp,
                                    :volunteer_org, :volunteer_functions, :language_id, :language_level,
                                    :programming_skills, :programing_languages, :strengths, :areas_to_develop, :hobbies,
                                    :student_availability, :avatar, :other_tools_skills, tool_ids:[]
    )
  end


end



