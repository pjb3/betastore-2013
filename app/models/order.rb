class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :credit_card
  has_many :line_items
  accepts_nested_attributes_for :line_items, :credit_card

  before_save :set_total_amount

  def self.recent
    where("placed_at > ?", 7.days.ago)
  end

  def self.by(customer)
    where(customer_id: customer.id)
  end

  def self.report
    puts "HEY"
  end

  def total_price
    line_items.inject(0) do |sum, li|
      li.total_price + sum
    end
  end

  def total_amount_in_cents
    (total_amount * 100).to_i
  end

  def set_total_amount
    self.total_amount = total_price
  end
end
