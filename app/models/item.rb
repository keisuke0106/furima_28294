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
    validates :category
    validates :condition
    validates :postage_type
    validates :preparation_day
    validates :shipping_region
    validates :price
  end
  
  validates :category_id, :condition_id, :postage_type_id, :shipping_region_id, :preparation_day_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one :purchase_history

end
