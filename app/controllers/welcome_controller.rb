class WelcomeController < ApplicationController
  caches_page :index

  def index
    @mags = Issue.order(created_at: :desc)
    @posts = Post.published.recent.page(params[:page]).per_page(5)
    @top_posts = @posts[0..3]
    @more_posts = @posts[4..27]
    respond_to do |format|
      format.html
      format.js
    end
  end


=begin
  def index
    @mags = Issue.active_slide.order(created_at: :desc)
    @articles = Post.blog_posts.published.recent.limit(12)
    @article_ids = @articles.select(:id).to_a
    @top_posts = @articles[0..1]
    @three_posts = @articles[2..4]
    @last_post = @articles[0..5].last
    @bottom_posts = @articles[6..8]
    @last_bottom_posts = @articles[9..11]
    @video = Post.video_posts.published.recent.first
  end
=end

  def contact_us

  end

  def search
    @q = params[:q]
    @results = Post.published.where("title LIKE ? OR body LIKE ?", "%#{@q}%", "%#{@q}%").page(params[:page]).per_page(27)
  end
end
