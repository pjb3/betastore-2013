class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :card_number
      t.string :cardholder_name
      t.integer :expiration_year
      t.integer :expiration_month

      t.timestamps
    end
  end
end
