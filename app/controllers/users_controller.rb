class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :basic_info]

  def index
    if user_signed_in?
      @users = User.all
    else
      redirect_to '/ingreso'
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
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

  def update
    respond_to do |format|
      if @user.update(user_params)
        puts '------------->>>>'
        puts 'ejecuta update (users_controller) '
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        puts '------------->>>>'
        puts 'no ejecuta update y hace render de edit (users_controller)'
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
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
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    #params.fetch(:user, {})
    params.require(:user).permit(:first_name, :last_name, :date_of_birth, :document_number, :mobile_phone, :city_id, :country_id, :university_id, :major_id,
                                 student_attributes: [:ed_level_id, :last_semester, :gpa, :gpa_max, :exchange_student, :country_id, :exchange_university, :highschool, :work_xp, :xp_company, :xp_position, :xp_achievements, :volunteer_xp, :volunteer_org, :volunteer_functions]
    )
  end
end
