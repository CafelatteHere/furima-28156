class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipment_type
  belongs_to :area
  belongs_to :days_to_ship
  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipment_type_id
    validates :area_id
    validates :days_to_ship_id
  end

  validates :price, presence: true, numericality: { only_integer: true, message: 'must be only integers, half-width' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'must be between 300 & 9999999' }
end
