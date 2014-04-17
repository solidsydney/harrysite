class SubscriberLetterWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(subscriber_id, message_id)
    subscriber = Contact.find(subscriber_id)
    message = NewsLetter.find(message_id)
    SubscriberMailer.send_news_letter(subscriber, message).deliver
  end
end