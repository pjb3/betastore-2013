class CreatePasswordResets < ActiveRecord::Migration
  def change
    create_table :password_resets do |t|
      t.belongs_to :customer, index: true
      t.string :token
      t.timestamp :used_at

      t.timestamps
    end
  end
end
