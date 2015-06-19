class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.timestamps
      t.integer :restaurant_id
      t.integer :number
    end

    create_table :orders do |t|
      t.integer :menu_id
      t.integer :table_id
    end

  end
end
