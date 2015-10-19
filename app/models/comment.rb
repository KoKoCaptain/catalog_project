class Comment < ActiveRecord::Base
  belongs_to :item
  default_scope -> { order('created_at DESC') }
  validates :comment_text, presence: true, length: { maximum: 140 }
  validates :item_id, presence: true
  accepts_nested_attributes_for :item
end
