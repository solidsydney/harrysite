class PostsController < ApplicationController
  def index
    @posts = Post.recent.page(params[:page]).per_page(27)
  end

  def show
    @post = Post.find(params[:id])
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
