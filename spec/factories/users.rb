FactoryBot.define do
  factory :user do
    nickname { 'furima太郎' }
    email { 'furima@taro.com' }
    password { 'taro111' }
    password_confirmation { password }

    first_name { '太郎' }
    last_name { '山田' }
    first_name_kana { 'タロウ' }
    last_name_kana { 'ヤマダ' }
    birth_date { '2000-01-01' }
  end
end
