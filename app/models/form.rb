class Form
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipalities, :address, :building_name, :phone_number, :purchase

  validates :user_id,        presence: true
  validates :item_id,        presence: true
  validates :postal_code,    presence: true
  validates :area_id,        presence: true
  validates :municipalities, presence: true
  validates :address,        presence: true
  validates :building_name,  presence: true
  validates :phone_number,   presence: true
  # validates :purchase,       presence: true

  def save
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    ShippingAddress.create!(postal_code: postal_code, area_id: area_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

end