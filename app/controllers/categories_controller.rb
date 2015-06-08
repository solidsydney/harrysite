class CategoriesController < ApplicationController
  def show
    if params[:id] && @category = Category.find(params[:id])
      @category = Category.includes(:posts).find(params[:id])
      @posts = @category.posts.recent.page(params[:page]).per_page(27)
    else
      redirect_to root_url, notice: "Page Not Found"
    end
  end
end
