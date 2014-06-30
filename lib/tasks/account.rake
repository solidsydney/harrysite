desc "Send Digest"
task :send_digest_emails => :environment do
  #Contact.find_each do |contact|
    contact = Contact.find_by_email("ramzauchenna@gmail.com")
    DigestWorker.perform_async(contact.id)
  #end
end