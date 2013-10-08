module ApplicationHelper
  def product_title(product)
    "#{product.name} - ##{product.id}"
  end
end
