class Manage::CategoriesController < Manage::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to manage_categories_path, notice: 'Category was successfully added.'
    else
      render action: "new"
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(category_params)
      #@user.create_activity :create, owner: current_user
      redirect_to manage_category_url(@category), notice: 'Category was successfully updated.'
    else
      render action: "edit"
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to manage_categories_path
  end

  private


  def category_params
    params.require(:category).permit(:name)
  end
end
