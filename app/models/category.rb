class Category < ActiveRecord::Base

    has_many :item_categories, dependent: :destroy
    has_many :items, through: :item_categories
    accepts_nested_attributes_for :items,
                                  reject_if: proc { |attributes| attributes['name'].blank? }
    accepts_nested_attributes_for :item_categories,
                                  reject_if: proc { |attributes| attributes['name'].blank? }
end
