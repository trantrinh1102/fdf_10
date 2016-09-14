class Admin::OrdersController < ApplicationController
  load_and_authorize_resource

  def index
    @orders = Order.includes(:user).page(params[:page]).per Settings.page_per
  end

  def show
  end

  def update
    if @order.update_attributes order_params
      flash[:success] = t "flash.success.update"
    else
      render :back
    end
  end

  private

  def order_params
    params.require(:order).permit :status
  end
end
