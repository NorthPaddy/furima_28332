class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :token, :item_id, :user_id
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :house_number
    validates :telephone_number, format: {with: /\A\d{11}\z/}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end

end
