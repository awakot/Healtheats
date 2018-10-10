FactoryBot.define do
  factory :restaurant do
    name { "サパテロ" }
    zip_code { 1500002 }
    address { "東京都渋谷区ほげほげ" }
    latitude { 35.6243541 }
    longitude { 135.2375432 }
  end
end
