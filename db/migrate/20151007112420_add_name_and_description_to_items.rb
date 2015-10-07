class AddNameAndDescriptionToItems < ActiveRecord::Migration
  def change
    add_column :items, :name, :string
    add_column :items, :description, :string
  end
end
