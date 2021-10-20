FactoryBot.define do
  factory :interest do
    interests_number { rand(1..5) }
    association :pawn
  end
end
