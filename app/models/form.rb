class Form
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipalities, :address, :building_name, :phone_number, :purchase, :token

  validates :user_id,        presence: true
  validates :item_id,        presence: true
  validates :postal_code,    presence: true, format: {with: /\A\d{3}[-]\d{4}\z/}
  validates :area_id,        presence: true, numericality: { other_than: 1 }
  validates :municipalities, presence: true
  validates :address,        presence: true
  validates :building_name,  presence: true
  validates :phone_number,   presence: true, format: {with: /\A\d{11}\z/}
  # validates :purchase,       presence: true
  validates :token,          presence: true

  def save
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    ShippingAddress.create!(postal_code: postal_code, area_id: area_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

end