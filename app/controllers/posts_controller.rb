class PostsController < ApplicationController
  def index
    if params[:search]
      @posts = Post.search(params[:search]).all.order('updated_at desc').paginate(per_page: 10, page: params[:page])
    else
      @posts = Post.all.order('updated_at desc').paginate(per_page: 10, page: params[:page])
    end
    @categories = Category.all.order('name ASC')
  end

  def show
    @post = Post.find(params[:id])
    @categories = Category.all.order('name ASC')
    @comment = Comment.new
    @comments = Comment.all
  end
end
