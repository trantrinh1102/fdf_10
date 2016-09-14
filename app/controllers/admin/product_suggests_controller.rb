class Admin::ProductSuggestsController < ApplicationController
  before_action :authenticate!, :authenticate_admin!
  load_and_authorize_resource

  def index
    @q = ProductSuggest.ransack params[:q]
    @product_suggests = @q.result.page(params[:page]).per Settings.page_per
  end

  def destroy
    if @product_suggest.destroy
      flash.now[:success] = t "flash.success.delete"
    end
    respond_to do |format|
      format.json do
        render json: {flash: flash}
      end
    end
  end

  def update
    if @product_suggest.update_attributes product_suggest_params
      flash[:success] = t "flash.success.update"
      head :ok
    else
      render :back
    end
  end

  private

  def product_suggest_params
    params.require(:productsuggest).permit :status
  end
end
