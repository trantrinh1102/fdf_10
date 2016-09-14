module Admin::OrdersHelper

  def label_to_status order
    if  order.done?
      support_label order, "label-warning"
    else
      support_label order, "label-danger"
    end
  end

  def support_label order, label_class
    content_tag :span, order.status, class: "label #{label_class}"
  end

  def option_status status, order
    content_tag(:option, value: admin_order_path(order,
      order: {status: status}),
      selected: check_status?(status, order.status)) do
      status
    end
  end

  def check_status? status, order_order
    status == order_order
  end
end
