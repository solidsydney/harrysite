class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.published.recent.page(params[:page]).per_page(27)
  end
end
