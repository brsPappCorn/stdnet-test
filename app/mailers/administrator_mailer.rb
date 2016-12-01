class AdministratorMailer < ApplicationMailer
  def new_offer(opportunity)
    @opportunity = opportunity
    mail to: ENV['ADMIN_NOTIFICATION_EMAIL'], subject: 'Nueva oferta publicada'
  end

  def new_apply(opportunity, student)
    @opportunity = opportunity
    @student = student
    mail to: @opportunity.user.email, bcc: ENV['ADMIN_NOTIFICATION_EMAIL'], subject: 'Nueva aplicación'
  end

  def acquire_information(opportunity, student)
    @opportunity = opportunity
    @student = student
    mail to: ENV['ADMIN_NOTIFICATION_EMAIL'], subject: 'Solicitud de información de estudiantes'
  end
end
