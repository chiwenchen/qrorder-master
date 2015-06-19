class AddSelectionToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :selection, :boolean
  end
end
