class ApplicationMailer < ActionMailer::Base
  default from: 'donot-reply@domain.com'
  layout 'mailer'
end
