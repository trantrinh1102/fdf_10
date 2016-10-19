class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @product = Product.find_by id: comment_params[:product_id]
    @comment = @product.comments.build(comment_params)
    # binding.pry
    if @comment.save
      # flash[:success] = t "flash.success.create"
      flash.now[:success] = t "flash.success.delete"

    respond_to do |format|
      format.json do
        render json: {flash: flash}
      end
    end
    else
      # flash[:success] = t "flash.success.error"
      flash.now[:success] = t "flash.success.delete"

    end
    # redirect_to @product
  end

  def destroy
    if @comment.destroy
      flash.now[:success] = t "flash.success.delete"
    end
    respond_to do |format|
      format.json do
        render json: {flash: flash}
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content, :user_id, :product_id
  end
end
