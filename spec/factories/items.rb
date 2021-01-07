FactoryBot.define do
  factory :item do
    product     {"商品名"}
    price       {"99999"}
    explanation {"商品の説明"}
    category_id {"2"}
    state_id    {"2"}
    postage_id  {"2"}
    area_id     {"2"}
    wait_id     {"2"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
