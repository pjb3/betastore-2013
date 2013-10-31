module ApplicationHelper
  def product_title(product)
    product.name
  end

  def copyright_year
    Time.current.year
  end

  def cart_item_count
    if session[:cart]
      session[:cart].values.sum
    else
      0
    end
  end
end
