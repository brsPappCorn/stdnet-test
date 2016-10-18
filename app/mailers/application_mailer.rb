class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@studnet.com.co' #TODO: Change default from
  layout 'mailer'
end
