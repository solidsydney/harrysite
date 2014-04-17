class Manage::ContactsController < Manage::BaseController
  def index
    @contacts = Contact.page(params[:page]).per_page(100)
  end
end
