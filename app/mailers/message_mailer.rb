class MessageMailer < ActionMailer::Base
  def send_message(message)
    @subject = "New contact us message from Blanck Digital"
    @recipients = "info@blanckdigital.com"
    @body = message.message
    @from = message.email
    @name = message.name
    @sent_on = Time.now.utc

    mail to: @recipients, subject: @subject, :from => message.email
  end
end
