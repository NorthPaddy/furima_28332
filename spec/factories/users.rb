FactoryBot.define do
  factory :user do
    nickname              { 'yamada' }
    email                 { 'sample@sample' }
    password              { '000000' }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '太郎' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1986/08/18' }
  end
end
