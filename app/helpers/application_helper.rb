module ApplicationHelper
  def product_title(product)
    "#{product.name} - ##{product.id}"
  end

  def copyright_year
    Time.current.year
  end
end