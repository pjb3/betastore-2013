class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items
  has_many :product_categorizations
  has_many :categories, :through => :product_categorizations

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  has_attached_file :photo,
    :styles => {
      :medium => "600x600>",
      :thumb => "100x100>"
    }, :default_url => "/images/:style/missing.png"

  def image_url
    "/products/#{name.downcase.tr(' ', '_')}.jpg"
  end

  def self.in_category(category_id)
    includes(:product_categorizations)
      .where('product_categorizations.category_id' => category_id)
  end

  def self.search(term)
    where("name ILIKE ?", "%#{term}%")
  end

end
