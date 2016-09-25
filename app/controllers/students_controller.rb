class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    # @users = User.all
    @students = Student.all
  end

  def show
    if user_signed_in?
    @user = User.find_by_id(current_user.id)
    else
      redirect_to '/ingreso'
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
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # TODO: Students controller. This action is deleting the student record that was created upon user sign up. Must fix this bug
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # TODO: Students Controller - destroy action only allowed by Admin role
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'El estudiante se elimino exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(:university_id, :major_id,
                                    :ed_level_id, :last_semester, :gpa, :exchange_student, :exchange_country_id, :exchange_university, :highschool
    )
  end
end
