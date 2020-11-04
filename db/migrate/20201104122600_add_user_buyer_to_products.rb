class AddUserBuyerToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :user, null: false, foreign_key: true
    add_column :products, :buyer_id, :integer
  end
end
