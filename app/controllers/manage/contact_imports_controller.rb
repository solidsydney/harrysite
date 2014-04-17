class Manage::ContactImportsController < Manage::BaseController
  def new
    @contact_import = ContactImport.new
  end

  def create
    @contact_import = ContactImport.new(import_params)
    if @contact_import.save
      redirect_to manage_contacts_url, notice: "Imported contacts successfully."
    else
      render :new
    end
  end

  private

  def import_params
    params.require(:contact_import).permit(:file)
  end
end
