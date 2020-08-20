class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :preparation_day

  validates :title, :text, :genre, presence: true
  validates :genre_id, numericality: { other_than: 1 }


  belongs_to :user
  has_one :purchase_history

end
