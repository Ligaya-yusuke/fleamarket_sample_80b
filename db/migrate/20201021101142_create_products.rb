class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :infomation, null: false
      t.string :price, null: false
      t.string :brand
      t.integer :prefecture_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_charge_id, null: false
      t.integer :shipping_day_id, null: false
      t.timestamps
    end
  end
end
