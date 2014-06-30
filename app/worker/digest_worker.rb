class DigestWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(subscriber_id)
    subscriber = Contact.find(subscriber_id)
    DigestMailer.send_daily_digest(subscriber).deliver
  end
end