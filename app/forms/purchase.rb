class Purchase
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_region_id, :city, :house_number, :building_name, :phone_number, :token, :user_id, :item_id, :purchase_history_id

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }

    validates :shipping_region_id
    validates :city
    validates :house_number
    # validates :token
  end

  validates :shipping_region_id, numericality: { other_than: 1 }

  def save
    history = PurchaseHistory.create!(user_id: user_id, item_id: item_id)
    ShippingAddress.create!(post_code: post_code, shipping_region_id: shipping_region_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_history_id: history.id)
  end
end
