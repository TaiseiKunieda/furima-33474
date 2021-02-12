FactoryBot.define do
  factory :form do

    postal_code    {"123-4567"}
    area_id        {2}
    municipalities {"横浜"}
    address        {"青山"}
    building_name  {"柳ビル"}
    phone_number   {"09012345678"}
    token          {"tok_abcdefghijk00000000000000000"}

  end
end
