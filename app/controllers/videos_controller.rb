class VideosController < ApplicationController
  def index
    @videos = Post.video_posts.published.recent.page(params[:page]).per_page(27)
  end

  def show
    @video = Post.find(params[:id])
    @post = @video
    impressionist(@post)
    respond_to do |format|
      if mobile_device?
        format.html {render layout: "mobile"}
      else
        format.html {render layout: "application"}
      end
    end
  end
end
