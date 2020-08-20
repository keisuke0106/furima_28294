class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :preparation_day
  belongs_to :user
  has_one :purchase_history

end
