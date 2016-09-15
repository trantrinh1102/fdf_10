module Admin::ProductSuggestsHelper

  def option_status_product status, productsuggest
    content_tag(:option, value: admin_product_suggest_path(productsuggest,
      productsuggest: {status: status}),
      selected: check_status?(status, productsuggest.status)) do
      status
    end
  end

  def check_status? status, productsuggest
    status == productsuggest
  end
end
