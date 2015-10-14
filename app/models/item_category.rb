class ItemCategory < ActiveRecord::Base

  belongs_to :item
  belongs_to :category
  accepts_nested_attributes_for :item
  accepts_nested_attributes_for :category

end
