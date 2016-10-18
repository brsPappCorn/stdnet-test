class StudentMailer < ApplicationMailer
  def notify_new_offer(opportunity, student)
    @opportunity = opportunity
    @student = student
    mail to: student.user.email, subject: 'Nueva oferta publicada'
  end
end
