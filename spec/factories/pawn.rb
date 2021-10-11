FactoryBot.define do
  factory :pawn do
    item_name { '腕時計' }
    item_price { rand(1..100) * 10000 }
    item_detail { 'オメガ' }
    item_remarks { '' }
    association :customer
  end
end