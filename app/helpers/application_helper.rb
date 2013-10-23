module ApplicationHelper
  def product_title(product)
    product.name
  end

  def copyright_year
    Time.current.year
  end
end
