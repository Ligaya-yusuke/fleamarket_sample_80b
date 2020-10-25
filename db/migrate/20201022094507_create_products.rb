class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :information, null: false
      t.string :price, null:false
      t.string :brand
      t.string :condition, null:false
      t.string :delivery_change, null: false
      # t.string :prefecture_id, null false  models/prefecture.rbに保存
      t.string :shipping_day, null:false 
      # t.references :category_id, null:false, foreign_key:true
      # t.references :user_id, null: false, foreign_key:true

      t.timestamps
    end
  end
end
