class Item < ActiveRecord::Base
  mount_uploader :item_image, ItemImageUploader


  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :categories,
                                reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :item_categories,
                                reject_if: proc { |attributes| attributes['category_id'].blank? }
  accepts_nested_attributes_for :comments,
                                reject_if: proc { |attributes| attributes['comment_text'].blank? }
end
