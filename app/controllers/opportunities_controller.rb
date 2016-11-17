class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy, :apply, :application_form, :applicants,
                                         :approve, :close, :acquire_information]

  def index
    if administrator_signed_in?
      redirect_to opportunities_administrators_path
    elsif user_signed_in?
      # Used to check what type of role is signed in
      @user_role = User.find_by_id(current_user.id)

      if @user_role.role_id == 2
        @all_opportunities = Opportunity.approved
        @opportunities = Opportunity.opportunities_for_student(@user_role.student)
      elsif @user_role.role_id == 3 || @user_role.role_id == 4
        redirect_to my_opportunities_opportunities_path
      end
    end
  end

  def show
    if user_signed_in?
      # Used to check what type of role is signed in
      @user_role = User.find_by_id(current_user.id)
    elsif administrator_signed_in?
      @user_role = Administrator.find_by_id(current_administrator.id)
    end
  end

  def new
    if current_user.profile_incomplete?
      redirect_to root_path
    else
      @opportunity = current_user.opportunities.build
    end
  end

  def edit
    if @opportunity.approved_state && user_signed_in?
      flash[:warning] = 'No puedes editar una oferta que ya ha sido aprobada.'
      redirect_to my_opportunities_opportunities_path
    end
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)

    respond_to do |format|
      if @opportunity.save
        AdministratorMailer.new_offer(@opportunity).deliver_now

        flash[:success] = 'Tu oferta fue creada exitosamente. Cuando recibas nuevas aplicaciones te llegará un correo de notificación.'
        format.html { redirect_to my_opportunities_opportunities_path }
      else
        flash[:error] = 'No se pudo crear tu oferta, por favor inténtalo nuevamente.'
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @opportunity.update(opportunity_params)
        flash[:success] = 'Tu oferta se ha actualizada exitosamente. Cuando recibas nuevas aplicaciones te llegará un correo de notificación.'
        format.html { redirect_to @opportunity }
      else
        flash[:error] = 'No se pudo actualizar tu oferta, por favor inténtalo nuevamente.'
        format.html { render :edit }
      end
    end
  end

  def destroy
    if administrator_signed_in?
      @opportunity.destroy
      respond_to do |format|
        flash[:success] = 'Tu oferta fue eliminada exitosamente.'
        format.html { redirect_to opportunities_url }
      end
    else
      flash[:error] = 'No se pudo eliminar tu oferta, por favor inténtalo nuevamente.'
      redirect_to root_path
    end
  end

  #================
  # Custom Actions
  #================
  def my_opportunities
    # Used to check what type of role is signed in
    @user_role = User.find_by_id(current_user.id)

    # Used for companies/people that create opportunities
    @my_opportunities = Opportunity.where(user_id: [current_user.id])

    # Used for students that applied to opportunities
    @student_opportunities = @user_role.applied_opportunities
  end

  def applicants
    if (user_signed_in? && (current_user.role_id == 3 || current_user.role_id == 4)) || administrator_signed_in?
      @applicants = @opportunity.applied_users
    elsif user_signed_in? && current_user.role_id == 2
      redirect_to root_path
    end
  end

  def application_form
    @application = @opportunity.applications.build
  end

  def apply
    @application = @opportunity.applications.build user_id: current_user.id
    @application.assign_attributes application_params

    if @application.save
      AdministratorMailer.new_apply(@opportunity, current_user.student).deliver_now

      flash[:success] = 'Aplicaste exitosamente a esta oferta. Recuerda estar pendiente de tu correo y celular registrados por si la empresa / persona quiere contactarte.'
      redirect_to opportunities_path
    else
      flash[:error] = 'Se ha generado un error. Por favor aplica a la oferta nuevamente.'
      render :application_form
    end

  end

  def approve
    if administrator_signed_in?
      @opportunity.approve

      possible_students = @opportunity.other_majors ? Student.all : Student.students_for_opportunity(@opportunity)

      possible_students.each do |student|
        StudentMailer.notify_new_offer(@opportunity, student).deliver_now
      end

      flash[:success] = 'La oferta ha sido aprobada exitosamente.'
      redirect_to opportunities_administrators_path
    else
      flash[:error] = 'La oferta no ha sido aprobada. Por favor intentalo nuevamente.'
      redirect_to root_path
    end
  end

  def close
    if @opportunity.close
      flash[:success] = "La oferta '#{@opportunity.opportunity_title}' ha sido cerrada exitosamente."
    else
      flash[:error] = "La oferta '#{@opportunity.opportunity_title}' no se pudo cerrar. Inténtalo nuevamente."
    end

    redirect_to administrator_signed_in? ? opportunities_administrators_path : my_opportunities_opportunities_path
  end

  def acquire_information
    student = User.find(params[:applicant_id]).student
    AdministratorMailer.acquire_information(@opportunity, student).deliver_now

    flash[:success] = 'Tu solicitud ha sido recibida exitosamente. En unos momentos nuestro equipo comercial se pondrá en contacto contigo para indicarte cómo realizar el pago y enviarte la información del estudiante.'
    redirect_to applicants_opportunity_path @opportunity
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_opportunity
    @opportunity = Opportunity.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def opportunity_params
    params.require(:opportunity).permit(:opportunity_type, :opportunity_title, :activity_description, :skills_description,
                                        :major_id, :other_majors, :question_for_student, :date_ini, :opportunity_duration,
                                        :availability, :cost_or_offer_option, :opportunity_cost, :receive_portfolio,
                                        :number_of_students, :user_id, :student_availability, :date_ini_type, :opportunity_duration_type,
                                        major_ids: []
    )
  end

  def application_params
    params.require(:application).permit(
        :student_characteristics,
        :student_interests,
        :student_answer,
        :opportunity_value,
        :portfolio
    )
  end
end