class ProductsController < ApplicationController
  load_and_authorize_resource

  def show
    @comment = Comment.new if user_signed_in?
  end
end
