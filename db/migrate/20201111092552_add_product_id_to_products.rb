class AddProductIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :condition_id, :string
  end
end
