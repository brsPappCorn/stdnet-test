class PeopleController < ApplicationController
  before_action :set_person, only: :show

  def index
    if administrator_signed_in?
      @people = Person.all.page params[:page]
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

  private
  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:id, :occupation, :profession)
  end
end
