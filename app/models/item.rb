class Item < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  accepts_nested_attributes_for :categories,
                                reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :item_categories,
                                reject_if: proc { |attributes| attributes['name'].blank? }
end
