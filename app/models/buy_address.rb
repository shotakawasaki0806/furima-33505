class BuyAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :house_number, :building_name, :phone

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone, length: {maximum: 11}, format: {with: /\d/}
  end

  def save
    buy = Buy.create(user_id: user_id, item_id:item_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, building_name: building_name, phone: phone, buy_id: buy.id)
  end
end