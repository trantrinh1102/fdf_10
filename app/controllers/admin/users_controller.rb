class Admin::UsersController < ApplicationController
  before_action :authenticate!, :authenticate_admin!
  load_and_authorize_resource

  def index
    @q = User.user.ransack params[:q]
    @users = @q.result.page(params[:page]).per Settings.page_per
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "flash.success.create"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "flash.success.update"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash.now[:success] = t "flash.success.delete"
    end
    respond_to do |format|
      format.json do
        render json: {flash: flash}
      end
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :current_password, :phone, :gender, :avatar
  end
end
