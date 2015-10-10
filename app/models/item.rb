class Item < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories

end
