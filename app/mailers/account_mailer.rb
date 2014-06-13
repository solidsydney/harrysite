class AccountMailer < ActionMailer::Base
  def new_account(user)
    @user = user
    mail to: user.email, subject: "Your new Punch Invoice portal account details", from: "no_reply@punch_invoice.com"
  end
end
