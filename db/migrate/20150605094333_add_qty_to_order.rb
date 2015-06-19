class AddQtyToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :quantity, :integer
    remove_column :orders, :selection, :boolean
  end
end
