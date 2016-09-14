class Chatwork

  class << self
    def send_message orders
      room_id = Settings.room_id
      message_body = "#{I18n.t "orders.order_items.list"}: \n"
      orders.order_items.each do |item|
        message_body += "#{I18n.t "orders.order_items.category"}:  #{item.product.category.try :name} "
        message_body += "#{I18n.t "orders.order_items.name"}:  #{item.product.name} "
        message_body += "#{I18n.t "orders.order_items.quantity"}: #{item.quantity} "
        message_body += "#{I18n.t "orders.order_items.price"}: #{item.total_price} \n"
      end
      ChatWork::Message.create room_id: room_id, body: message_body
    end
  end
end
