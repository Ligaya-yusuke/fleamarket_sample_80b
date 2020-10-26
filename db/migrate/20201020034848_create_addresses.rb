class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :ship_first_name,       null: false
      t.string :ship_family_name,      null: false
      t.string :ship_first_name_kana,  null: false
      t.string :ship_family_name_kana, null: false
      t.string :post_code,       null: false
      # t.string :prefecture,       null: false
      t.string :city,            null: false
      t.string :block_number,    null: false
      t.string :building_number
      t.string :phone_number,    null: false
      t.references :user,        null: false, foreign_key:true
      t.timestamps
    end
  end
end
