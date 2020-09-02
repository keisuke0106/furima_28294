FactoryBot.define do
  factory :purchase do
    post_code             { '123-4567' }
    shipping_region_id    { 2 }
    city                  { '札幌市' }
    house_number          { '札幌1-1-1' }
    building_name         { '六合グリーンハイツ' }
    phone_number          { '09071720987' }
    token                 { 'tok_4fc00f61d0ac87098173cbd35e58' }
  end
end
