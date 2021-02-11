FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 { Faker::Internet.email }
    password              {"111aaa"}
    password_confirmation {password}
    first_name_J          {"太郎"}
    last_name_J           {"山田"}
    first_name_K          {"タロウ"}
    last_name_K           {"ヤマダ"}
    birthday              {"1930-01-01"}
  end
end