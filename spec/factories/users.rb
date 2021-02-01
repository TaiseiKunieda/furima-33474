FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"111aaa"}
    password_confirmation {password}
    first_name_J          {"山田"}
    last_name_J           {"太郎"}
    first_name_K          {"ヤマダ"}
    last_name_K           {"タロウ"}
    birthday              {"1930-01-01"}
  end
end