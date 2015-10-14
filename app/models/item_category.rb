class ItemCategory < ActiveRecord::Base

  belongs_to :item
  belongs_to :category
  accepts_nested_attributes_for :item,
                                reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :category,
                                reject_if: proc { |attributes| attributes['name'].blank? }
end
