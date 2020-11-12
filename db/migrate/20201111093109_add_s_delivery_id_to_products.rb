class AddSDeliveryIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :delivery_charge_id, :string
    add_column :products, :shipping_day_id, :string
  end
end
