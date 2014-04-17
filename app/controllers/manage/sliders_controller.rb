class Manage::SlidersController < Manage::BaseController
  def index
    @sliders = Slider.all
  end

  def new
    @slider = Slider.new
  end

  def edit
    @slider = Slider.find(params[:id])
  end

  def create
    @slider = Slider.new(category_params)
    if @slider.save
      redirect_to manage_sliders_url, notice: 'Slider was successfully added.'
    else
      render action: "new"
    end
  end

  def update
    @slider = Slider.find(params[:id])

    if @slider.update_attributes(category_params)
      #@user.create_activity :create, owner: current_user
      redirect_to manage_sliders_url, notice: 'Slider was successfully updated.'
    else
      render action: "edit"
    end
  end

  def show
    @slider = Slider.find(params[:id])
  end

  def destroy
    @slider = Slider.find(params[:id])
    @slider.destroy
    redirect_to manage_sliders_url
  end

  private


  def category_params
    params.require(:slider).permit(:name, :slide, :url, :caption)
  end
end
