FactoryBot.define do
  factory :order_address do
    postal_code       { '123-4567' }
    prefecture_id     { 2 }
    city              { '東京都' }
    house_number      { '港区' }
    building_name     { '東京マンション' }
    telephone_number  { '00012341234' }
  end
end
