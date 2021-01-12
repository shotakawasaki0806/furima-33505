FactoryBot.define do
  factory :buy_address do
    postal_code   {"123-4567"}
    area_id       {2}
    city          {"市町村"}
    house_number  {"１−２"}
    building_name {"マンション"}
    phone         {"08012345678"}
    token         {"tok_abcdefghijk00000000000000000"}
  end
end
