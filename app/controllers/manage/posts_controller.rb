class Manage::PostsController < Manage::BaseController
  skip_before_action :ensure_administrators
  before_action :ensure_administrators_or_editor
  def index
    if current_user.admin?
     @posts = Post.order("created_at desc")
    else
     @posts = current_user.posts.order("created_at desc")
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to manage_post_path(@post), notice: 'Post was successfully created.'
    else
      render action: "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
    unless current_user.admin? || @post.try(:user) == current_user
      redirect_to manage_root_url
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to manage_post_path(@post), notice: "Updated Post"
    else
      render action: 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    unless current_user.admin? || @post.try(:user) == current_user
      return redirect_to manage_root_url
    end
    @post.destroy
    redirect_to manage_posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image, :video_url, :publish_on, :post_type, :summary, category_ids: [])
  end
end
