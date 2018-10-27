FactoryBot.define do
  factory :user do
    first_name { "Tom" }
    last_name { "Morello" }
    username { "ToMo" }
    district_id { 1 }
    email { "tomo@gmail.com" }
  end
end
