class Contact < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  scope :no_account, -> {where(has_account: false)}
  scope :active_contacts, ->  {where(active: true)}

  def self.subscribe_all
    Contact.all.each do |contact|
      begin
        puts "Subscribing email: #{contact.email}"
        gb = Gibbon::API.new("117a1dbf06bbf00c05855669a4c75b06-us3")
        gb.lists.subscribe({:id => '3a8c4b9bbe', :email => {:email => contact.email}, :double_optin => false})
        puts "Done"
      rescue Gibbon::MailChimpError => e
            e.message
      end
    end
  end

  def self.all_subscribers
      begin
        gb = Gibbon::API.new("117a1dbf06bbf00c05855669a4c75b06-us3")
        members = gb.listMemberInfo({:id => '3a8c4b9bbe'})
        members.each do

        end

        #members = gb.get_exporter.list({:id => '3a8c4b9bbe'})
        puts members.map { |k,v| "#{k} is #{v}" }

      rescue Gibbon::MailChimpError => e
        e.message
      end
  end


end
