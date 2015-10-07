class CreateItemCategories < ActiveRecord::Migration
  def change
    create_table :item_categories do |t|
      t.integer :item_id
      t.integer :category_id

      t.timestamps null: false
    end

    add_index :item_categories, :item_id
    add_index :item_categories, :category_id
    add_index :item_categories, [:item_id, :category_id], unique: true

  end
end
