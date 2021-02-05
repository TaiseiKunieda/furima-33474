class Purchase < ApplicationRecord
  belongs_to :user
  has_one :item
  #belongs_to :shipping_address
end
