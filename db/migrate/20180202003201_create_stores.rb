class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :purchaser_name
      t.string :item_description
      t.float :item_price, default: 0.0
      t.integer :purchase_count, default: 0
      t.string :merchant_address
      t.string :merchant_name

      t.timestamps null: false
    end
  end
end
