class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
    @q = Product.ransack params[:q]
    @products = @q.result.page(params[:page]).per Settings.page_per
  end
end
