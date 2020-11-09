class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :infomation, null: false
      t.string :price, null: false
      t.string :brand
      t.string :condition_id, null: false
      t.string :delivery_charge_id, null: false
      t.string :prefecture_id, null: false
      t.string :shipping_day_id, null: false
      t.timestamps
    end
  end
end
