FactoryBot.define do
  factory :menu do
    name { "野菜たっぷり鶏肉サラダ" }
    description { "タンパク質と食物繊維を効率的に摂れるメニュー" }
    price { 800 }
    picture { "mock" }
    calorie_id { 1 }

    after(:create) do |menu|
      create(:menu_category, menu: menu, category: create(:category))
      create(:menu_tag, menu: menu, tag: create(:tag))
    end
  end
end
