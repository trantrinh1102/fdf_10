class Admin::ProductsController < ApplicationController
  before_action :authenticate!, :authenticate_admin!
  before_action :load_categories, except: [:index, :destroy]
  before_action :load_product, only: [:edit, :destroy, :update]

  def index
    @q = Product.ransack params[:q]
    @products = @q.result.page(params[:page]).per Settings.page_per
  end

  def new
    @product_suggest =  ProductSuggest.find_by id: params[:product]
    if @product_suggest
      @product = Product.new  name: @product_suggest.product_name,
        description: @product_suggest.description,
        image: @product_suggest.image,
        category_id: @product_suggest.category_id
    else
      @product = Product.new
    end
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

  def edit
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "flash.success.update"
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    if @product.order_items.blank?
      if @product.destroy
        flash.now[:success] = t "admin.products.destroy.success"
      end
    else
      flash.now[:danger] = t "admin.products.destroy.danger"
    end
    respond_to do |format|
      format.json do
        render json: {flash: flash}
      end
    end
  end

  private

  def product_params
    params.require(:product)
      .permit :name, :description, :price, :image, :category_id, :remove_image
  end

  def load_categories
    @categories = Category.order_name
  end

  def load_product
    @product = Product.find_by id: params[:id]
    if @product.nil?
      flash[:danger] = t "flash.danger.product_not_exist"
      redirect_to admin_products_path
    end
  end
end
