FactoryBot.define do

  factory :item do
    name                  { 'テスト' }
    explanation           { 'テストです' }
    category_id           { 2 }
    condition_id          { 2 }
    postage_type_id       { 2 }
    preparation_day_id    { 2 }
    shipping_region_id    { 2 }
    price                 { 600 }
    association :user
  end
end

