class OrderAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :shipping_from_id, :city, :address_line, :building, :phone_number

  validates :user_id, presence: { message: 'must exist' }
  validates :item_id, presence: { message: 'must exist' }
  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows" }
  validates :shipping_from_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :address_line, presence: true
  validates :phone_number, presence: true
  validates :phone_number, length: { minimum: 10, message: "is too short" }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_from_id: shipping_from_id, city: city, address_line: address_line, building: building, phone_number: phone_number, order_id: order.id)
  end
end