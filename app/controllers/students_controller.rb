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
    id = params[:id].to_i
    # Used to check what type of role is signed in
    @user_role = User.find_by_id(current_user.id)

    if user_signed_in? || administrator_signed_in?

      if params[:opportunity]
        user_id = params[:id]
        opportunity_id = params[:opportunity]
        @application = Application.where(user_id: user_id, opportunity_id: opportunity_id).first
      end

      @student_user = User.find_by_id(id)

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
        format.html { redirect_to root_path, notice: 'Student was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to root_path, notice: 'Student was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # TODO: Students Controller - destroy action only allowed by Admin role
  def destroy
    if administrator_signed_in?
      @student.destroy
      respond_to do |format|
        format.html { redirect_to students_url, notice: 'El estudiante se elimino exitosamente.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    if user_signed_in?
      user_id = current_user.id
      @student = Student.find_by_user_id(user_id)
    else
      redirect_to '/ingreso'
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(:id, :university_id, :major_id, :referenced_by,
                                    :ed_level_id, :last_semester, :gpa, :gpa_max, :exchange_student, :country_id, :exchange_university, :highschool,
                                    :work_xp, :xp_company, :xp_position, :xp_achievements, :volunteer_xp, :volunteer_org, :volunteer_functions,
                                    :language_id, :language_level, :programming_skills, :programing_languages, :strengths, :areas_to_develop, :hobbies,
                                    :student_availability,
                                    tool_ids:[]
    )
  end


end



