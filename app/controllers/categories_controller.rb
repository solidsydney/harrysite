class CategoriesController < ApplicationController
  def show
    puts params[:name]
    if params[:name] && @category = Category.find_by_name(params[:name])
      @category = Category.find_by_name(params[:name])
      @posts = @category.posts.published.recent.page(params[:page]).per_page(27)
    else
      redirect_to root_url, notice: "Page Not Found"
    end
  end
end
