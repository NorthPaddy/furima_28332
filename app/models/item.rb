class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage 
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_time

  belongs_to :user

  with_options presence: true  do
    validates :image
    validates :name
    validates :text
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_condition_id
      validates :postage_id
      validates :prefecture_id
      validates :delivery_time_id
    end
  end
    
end
