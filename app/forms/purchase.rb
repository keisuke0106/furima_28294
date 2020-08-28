class Purchase
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_region_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    VALID_POST_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
    validates :post_code, format: { with: VALID_POST_REGEX }

    VALID_PHONE_REGEX = /\A\d{10,11}\z/.freeze
    validates :phone_number, format: { with: VALID_PHONE_REGEX }
 
    validates :shipping_region_id
    validates :city
    validates :house_number
  end

  validates :shipping_region_id, numericality: { other_than: 1 }

  def save

  ShippingAddress.create(post_code: post_code, shipping_region_id: shipping_region_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  PurchaseHistory.create(user_id: user.id, item_id: item.id)
  end

end