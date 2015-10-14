class Item < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  accepts_nested_attributes_for :categories,
                                reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :item_categories,
                                reject_if: proc { |attributes| attributes['name'].blank? }

  #def add_category_to_item
  #  item_categories.create!(category_id: 1)  # вот тут хз как передать нужный id из селекта
 # end

end
