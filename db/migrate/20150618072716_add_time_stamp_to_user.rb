class AddTimeStampToUser < ActiveRecord::Migration
  def change
    add_column :users, :created_at, :datetime 
    add_column :users, :updated_at, :datetime

    add_column :menus, :price, :integer
  end
end
