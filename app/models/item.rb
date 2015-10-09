class Item < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :item_categories, foreign_key: 'item_id', dependent: :destroy
  has_many :categories, through: :item_categories, source: :category

  has_many :reverse_item_categories, foreign_key: 'category_id',
           class_name: 'ItemCategory',
           dependent: :destroy
  has_many :items, through: :reverse_item_categories, source: :item

end
