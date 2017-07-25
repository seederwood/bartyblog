class Admin::PostsController < Admin::ApplicationController
  include Admin::PostsHelper
  before_action :set_post, only: %i[edit update destroy]
  def new
    @page_title = 'Add Post'
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if params[:post][:image].blank?
      @post.image = nil
    end

    if @post.save
      flash[:notice] = "Post #{@post.title} Created successfully!"
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def edit; end

  def update

    if params[:post][:image].blank?
      @post.image = nil
    end

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
    @posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search]).all.order('updated_at desc').paginate(per_page: 10, page: params[:page])
    else
      @posts = Post.all.order('updated_at desc').paginate(per_page: 10, page: params[:page])
    end
  end
end
