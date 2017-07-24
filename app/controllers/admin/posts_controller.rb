class Admin::PostsController < Admin::ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  def new
    @page_title = 'Add Post'
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post #{@post.title} Created successfully!"
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post #{@post.title} Updated successfully!"
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post Deleted successfully!'
    redirect_to admin_posts_path
  end

  def index
    @posts= Post.all.order('updated_at desc')
  end

  private

  def post_params
    params.require(:post).permit(:title, :category_id, :user_id, :tags, :body, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
