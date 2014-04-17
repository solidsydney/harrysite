namespace :new_subscriber_account do
  desc "Create account for all subscribers"
  task :new_user => :environment do
    Contact.no_account.find_each do |contact|
      ContactWorker.perform_async(contact.id)
    end
  end
end