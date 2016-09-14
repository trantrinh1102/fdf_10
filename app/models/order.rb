class Order < ActiveRecord::Base
  attr_accessor :cart

  belongs_to :user
  has_many :order_items
  after_create :build_order_items
  before_create :set_default_status

  scope :by_date, ->{order created_at: :desc}
  enum status: [:pending, :done]

  private

  def build_order_items
    cart.items.each do |item|
      order_items.create product_id: item.product_id,
        quantity: item.quantity
    end
  end

  def set_default_status
    self.status ||= :open
  end
end
