class PostsController < ApplicationController
  def index
    @posts = Post.published.recent.page(params[:page]).per_page(27)
  end

  def show
    @post = Post.published.find(params[:id])
    impressionist(@post)
    respond_to do |format|
      #if mobile_device?
       # format.html {render layout: "mobile"}
      #else
        format.html
      #end
    end
  end
end
