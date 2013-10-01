class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  
  before_validation :set_price
  
  def set_price
    self.price = product.price
  end
  
  def total_price
    quantity * price
  end
end