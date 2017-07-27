class Admin::UsersController < Admin::ApplicationController
  include Admin::UsersHelper
  before_action :verify_logged_in
  before_action :set_user, only: %i[edit update destroy]
  def new
    @page_title = 'Add User'
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User #{@user.name} Created successfully!"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = "User #{@user.name} Updated successfully!"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = 'User Deleted successfully!'
    redirect_to admin_users_path
  end

  def index
    @users = User.all
    if params[:search]
      @users = User.search(params[:search]).all.order('updated_at desc').paginate(per_page: 10, page: params[:page])
    else
      @users = User.all.order('updated_at desc').paginate(per_page: 10, page: params[:page])
    end
  end
end
