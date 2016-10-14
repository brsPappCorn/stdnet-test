class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    if administrator_signed_in?
      @people = Person.all
    else
      redirect_to root_path
    end
  end

  def show
    if user_signed_in?
      @user = User.find_by_id(current_user.id)
    else
      puts '---------------->>>>>'
      puts 'no existe usuario'
    end
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to root_path, notice: 'La persona fue creada exitosamente.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to root_path, notice: 'La persona fue actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if administrator_signed_in?
      @person.destroy
      respond_to do |format|
        format.html { redirect_to people_url, notice: 'La persona fue eliminada exitosamente.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_person
    if user_signed_in?
      user_id = current_user.id
      @person = Person.find_by_user_id(user_id)
    else
      redirect_to '/ingreso'
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(:id, :occupation, :profession)
  end
end
