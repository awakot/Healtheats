FactoryBot.define do
  factory :menu do
    name { "野菜たっぷり鶏肉サラダ" }
    description { "タンパク質と食物繊維を効率的に摂れるメニュー" }
    price { 800 }
    picture { "mock" }
    calorie_id { 1 }
  end
end
