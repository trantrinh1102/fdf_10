class Admin::CategoriesController < ApplicationController

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

  private

  def category_params
    params.require(:category).permit :name, :description
  end
end
