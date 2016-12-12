class StudentsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_student, only: [:show, :delete_second_major, :destroy]

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
        @application = Application.where(user_id: @student.user.id, opportunity_id: params[:opportunity]).first
      end
    else
      redirect_to root_path
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

  def delete_second_major
    if user_signed_in?
      if @student.delete_second_major
        flash[:success] = 'Has eliminado la información de "Otra carrera"'
        redirect_to @student
      else
        flash[:error] = 'Ocurrió un error, por favor inténtelo de nuevo.'
        redirect_to edit_user_path @student.user
      end
    else
      flash[:error] = 'No tiene permisos para realizar esta acción.'
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
                                    :student_availability, :avatar, :other_tools_skills, tool_ids:[])
  end


end



