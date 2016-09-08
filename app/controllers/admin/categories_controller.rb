class Admin::CategoriesController < ApplicationController
  before_action :load_category, only: [:edit, :destroy, :update]

  def index
    @q = Category.ransack params[:q]
    @categories = @q.result.page(params[:page]).per Settings.page_per
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "flash.success.create"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def destroy
    if @category.products.blank?
      if @category.destroy
        flash.now[:success] = t "admin.categories.destroy.success"
      end
    else
      flash.now[:danger] = t "admin.categories.destroy.danger"
    end
    respond_to do |format|
      format.json do
        render json: {flash: flash}
      end
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "flash.success.update"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit :name, :description
  end

  def load_category
    @category = Category.find_by id: params[:id]
    if @category.nil?
      flash[:danger] = t "flash.danger.category_not_exist"
      redirect_to admin_categories_path
    end
  end
end
