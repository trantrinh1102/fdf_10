class Order < ActiveRecord::Base
  attr_accessor :cart

  belongs_to :user
  has_many :order_items
  after_save :build_order_items

  scope :by_date, ->{order created_at: :desc}

  private

  def build_order_items
    cart.items.each do |item|
      order_items.create product_id: item.product_id,
        quantity: item.quantity
    end
  end
end
