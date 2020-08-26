class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :order

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :house_number
    validates :telephone_number, format: {with: /\A\d{11}\z/}

  end
end
