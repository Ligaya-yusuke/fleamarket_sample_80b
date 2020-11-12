class AddSRrctoImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :src, :string
  end
end
