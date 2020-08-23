class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :preparation_day

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :postage_type_id
    validates :preparation_day_id
    validates :shipping_region_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  validates :category_id, :condition_id, :postage_type_id, :shipping_region_id, :preparation_day_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one :purchase_history
  has_one_attached :image
end
