class OrderShipment
  include ActiveModel::Model
  attr_accessor :prefecture_id, :zip_code, :city, :house_number, :building_name, :tel, :user_id, :item_id, :token
  # attr_reader :item, :user

  with_options presence: true do
    validates  :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "must include 7 digits and contain hyphen after 3rd digit" }
    validates  :city
    validates  :house_number
    validates  :tel, length:{maximum: 11}, format: { with: /\A\d+\z/, message: "can include only digits"}
  end

  validates :prefecture_id, numericality: { other_than: 1 }
  validates :building_name, allow_blank: true, length: { minimum: 2 }
  validates :token, presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id, token: token)
    shipment = Shipment.create(prefecture_id: prefecture_id, zip_code: zip_code, city: city, house_number: house_number, building_name: building_name, tel: tel, order_id: order.id)
  end
end