desc "Send Digest"
task :send_digest_emails => :environment do
  #Contact.active_contacts.find_each do |contact|
    contact = Contact.active_contacts.find_by_email("ramzauchenna@gmail.com")
    DigestWorker.perform_async(contact.id)
  #end
end