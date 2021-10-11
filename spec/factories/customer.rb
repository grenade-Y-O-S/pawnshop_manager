FactoryBot.define do
  factory :customer do
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    address { '東京都千代田区丸の内3丁目3-1' }
    birth_date { '1995-01-01' }
    phone_number { '09012345678' }
    job { '会社員' }
  end
end