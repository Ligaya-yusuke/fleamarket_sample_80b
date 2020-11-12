class AddSProductIdToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :product_id, :string
  end
end
