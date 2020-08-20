FactoryBot.define do
  factory :item do
    image             { 'test_image.png' }
    name              { 'お餅' }
    text              { 'これはお餅です' }
    category_id       { 2 }
    item_condition_id { 2 }
    postage_id        { 2 }
    prefecture_id     { 2 }
    delivery_time_id  { 2 }
    price             { 300 }
    association       :user
  end
end
