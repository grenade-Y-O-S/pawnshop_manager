FactoryBot.define do
  factory :purchase do
    buy_item_name { '腕時計' }
    buy_item_price { rand(1..100) * 10000 }
    buy_item_detail { 'オメガ' }
    association :customer
  end
end
