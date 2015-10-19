class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.timestamps null: false
    end
    add_index :comments, [:item_id, :created_at]
  end
end
