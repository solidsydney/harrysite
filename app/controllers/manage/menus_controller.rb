class Manage::MenusController < Manage::BaseController
  respond_to :html, :json
  def index
    @menus = Menu.order(position: :asc).roots
  end

  def show
    @menu = Menu.find(params[:id])
    respond_with(@menu)
  end

  def new
    @menu = Menu.new
    form_info
  end

  def create
    @menu = Menu.new(allowed_params)

    if @menu.save
      redirect_to manage_menus_url, notice: "Menu added"
    else
      form_info
      render :action => :new
    end
  end

  def edit
    @menu = Menu.find(params[:id])
    form_info
  end

  def update
    @menu = Menu.find(params[:id])

    if @menu.update_attributes(allowed_params)
      redirect_to :action => :index
    else
      form_info
      render :action => :edit
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    redirect_to :action => :index
  end

  private

  def allowed_params
    params.require(:menu).permit( :name, :parent_id, :category_id, :url, :position )
  end

  def form_info
    @menus = Menu.all
    @categories = Category.all
  end
end
