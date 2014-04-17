class ContactWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(id)
    contact = Contact.find(id)
    user = User.create(email: contact.email, password: User.generate_password)
    UserMailer.send_account_email(user).deliver
    User.transaction do
      contact.has_account = false
      contact.save
    end
  end
end