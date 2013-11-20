class CreateProductCategorizations < ActiveRecord::Migration
  def change
    create_table :product_categorizations do |t|
      t.belongs_to :category, index: true
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
