class ShippingAddress < ApplicationRecord
  belongs_to :purchase_history

  with_options presence: true do
    validates :post_code
    validates :prefecture_name
    validates :city
    validates :house_number
    validates :phone_number
  end

  validates :shipping_region_id, numericality: { other_than: 1 }
end
