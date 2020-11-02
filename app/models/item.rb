class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipment_type_id, presence: true
  validates :area_id, presence: true
  validates :days_to_ship_it, presence: true
  validates :price, presence: true

end
