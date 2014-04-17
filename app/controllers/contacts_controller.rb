class ContactsController < ApplicationController
  def create
    @subscriber = Contact.new(contact_params)
    respond_to do |format|
      if @subscriber.save
        format.js
        format.html {redirect_to root_url, notice: "Thank you for subscribing to our newsletter"}
      else
        format.js
        format.html {redirect_to root_url, notice: "Failed to subscribe"}
      end
    end
  end

  def mail_chimp_email
    begin
      gb = Gibbon::API.new("117a1dbf06bbf00c05855669a4c75b06-us3")
      gb.lists.subscribe({:id => '3a8c4b9bbe', :email => {:email => params[:email]}, :double_optin => false})
      respond_to do |format|
        format.js
      end
    rescue Gibbon::MailChimpError => e
        @e = e
        respond_to do |format|
          format.js {render template: "contacts/error"}
        end
    end
  end

  def unsubscribe_mail_chimp_email
    @email = [params[:email], ".com"].compact.join
    @contact = Contact.find_by(email: @email)
    @contact.active = false
    @contact.save
    redirect_to root_url
=begin
    #begin
      #gb = Gibbon::API.new("117a1dbf06bbf00c05855669a4c75b06-us3")
      gb.lists.unsubscribe({:id => '3a8c4b9bbe', :email => {:email => params[:email]}, :delete_member => true, :send_notify => true})
      respond_to do |format|
        format.js
      end
    rescue Gibbon::MailChimpError => e
      @e = e
      respond_to do |format|
        format.js {render template: "contacts/error"}
      end
    end
=end
  end

  private

  def contact_params
    params.require(:contact).permit(:email)
  end
end
