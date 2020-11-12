class Shipment < ApplicationRecord
  belongs_to :order
  belongs_to :prefecture

  with_options presence: true do
    validates:  zip_code
    validates:  city
    validates:  house_number
    validates:  tel
  end

  validates: prefecture_id, numericality: { other_than: 1 }
  validates: building_name
end
