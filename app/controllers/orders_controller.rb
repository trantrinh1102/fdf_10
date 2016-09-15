class OrdersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_login!

  def index
    @orders = current_user.orders.page(params[:page])
      .per(Settings.order_per).by_date
  end

  def new
    @order = Order.new
  end

  def show
  end

  def create
    if @cart.present?
      @order = Order.new order_params
      if @order.save
        OrderMail.index(@order, current_user).deliver
        session.delete("cart")
        Chatwork.send_message @order
        flash[:success] = t "flash.success.order"
        redirect_to order_path @order
      else
        redirect_to new_order_path
      end
    else
      redirect_to carts_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:shipping_address)
      .merge! user: current_user, total_pay: @cart.total_price, cart: @cart
  end
end

