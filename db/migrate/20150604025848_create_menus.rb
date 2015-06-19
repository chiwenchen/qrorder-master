class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :dish_name
      t.string :description
      t.string :photo
      t.timestamps
    end
  end
end
