class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :postage
  belongs_to :area
  belongs_to :days_to_ship
  belongs_to :user
  has_one_attached :image
  has_one :purchase



  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id, numericality: { other_than: 1 }
    validates :state_id, numericality: { other_than: 1 }
    validates :postage_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :days_to_ship_id, numericality: { other_than: 1 }
    validates :price, format: {with: /\A[0-9]+\z/}, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10000000 }
    validates :image
  end
end