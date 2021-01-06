FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"輝明"}
    last_name             {"佐藤"}
    first_kana            {"テルアキ"}
    last_kana             {"サトウ"}
    birthday              {"1992-08-06"}
  end
end