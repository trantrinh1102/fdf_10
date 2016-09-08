class Admin::ProductsController < ApplicationController
  before_action :load_categories, only: [:new, :create]

  def index
    @q = Product.ransack params[:q]
    @products = @q.result.page(params[:page]).per Settings.page_per
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "flash.success.create"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product)
      .permit :name, :description, :price, :image, :category_id
  end

  def load_categories
    @categories = Category.all
  end
end
