class Admin::CategoriesController < Admin::ApplicationController
  before_action :set_category, only: %i[edit update show destroy]
  def new
    @page_title = 'Add Category'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category #{@category.name} Created successfully!"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category #{@category.name} Updated successfully!"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = 'Category Deleted successfully!'
    redirect_to admin_categories_path
  end

  def index
    @categories = Category.all.order('updated_at desc')
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
