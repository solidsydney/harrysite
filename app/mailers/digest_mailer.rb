class DigestMailer < ActionMailer::Base
  def send_daily_digest(subscriber)
    @message = message
    @email = subscriber.email
    mail to: subscriber.email.gsub(",", ""), subject: "BlanckDigital Daily Digest", from: "\"BlanckDigital\" <noreply@blanckdigital.com>"
  end
end
