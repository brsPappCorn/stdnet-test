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
    if user_signed_in? || administrator_signed_in?
    else
      redirect_to root_path
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
        flash[:success] = 'La persona fue creada exitosamente.'
        format.html { redirect_to root_path }
      else
        flash[:error] = 'La persona no pudo ser creada, por favor intentarlo nuevamente.'
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        flash[:success] = 'La persona fue actualizada exitosamente.'
        format.html { redirect_to root_path }
      else
        flash[:error] = 'La persona no pudo ser actualizada, por favor intentarlo nuevamente.'
        format.html { render :edit }
      end
    end
  end

  def destroy
    if administrator_signed_in?
      @person.destroy
      respond_to do |format|
        flash[:success] = 'La persona fue eliminada exitosamente.'
        format.html { redirect_to people_url }
      end
    else
      flash[:error] = 'La persona no pudo ser eliminada, por favor intentarlo nuevamente.'
      redirect_to root_path
    end
  end

  private
  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:id, :occupation, :profession)
  end
end
