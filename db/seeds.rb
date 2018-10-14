return unless Rails.env == "development"

Menu.all.each{ |e| e.destroy }
Restaurant.all.each{ |e| e.destroy }
Calorie.all.each{ |e| e.destroy }
Category.all.each{ |e| e.destroy }
Tag.all.each{ |e| e.destroy }

%w(野菜たっぷりサラダ がっつりお肉 さっぱりお魚).each do |name|
  Category.create(name: name)
end

%w(200 500 700).each do |cal|
  Calorie.create(amount: cal.to_i)
end

%w(グリーンブラザーズ ガブリシェア 権八).each do |name|
  Restaurant.create(
    zip_code: 1500002,
    address: "東京都渋谷区",
    name: name,
    latitude: 35.673342,
    longitude: 139.8035575,
    created_at: Time.now,
    updated_at: Time.now
  )
end

5.times do |time|
  time = time.to_s

  calorie_id_menu_1 = Calorie.find_by(amount: 200)
  restaurant_id_menu_1 = Restaurant.find_by(name: "グリーンブラザーズ")
  menu_1 = Menu.create(
    name: "チキンサラダ_" + time,
    description: "タンパク質と食物繊維",
    price: 650,
    picture: "/uploads/salad.jpg",
    calorie_id: calorie_id_menu_1,
    restaurant_id: restaurant_id_menu_1,
    created_at: Time.now,
    updated_at: Time.now
  )
  menu_1.categories << Category.find_by(name: "野菜たっぷりサラダ")

  calorie_id_menu_2 = Calorie.find_by(amount: 700)
  restaurant_id_menu_2 = Restaurant.find_by(name: "ガブリシェア")
  menu_2 = Menu.create(
    name: "ステーキ定食_" + time,
    description: "タンパク質がっつり",
    price: 1000,
    picture: "/uploads/steak.jpg",
    calorie_id: calorie_id_menu_2,
    restaurant_id: restaurant_id_menu_2,
    created_at: Time.now,
    updated_at: Time.now
  )
  menu_2.categories << Category.find_by(name: "がっつりお肉")

  calorie_id_menu_3 = Calorie.find_by(amount: 500)
  restaurant_id_menu_3 = Restaurant.find_by(name: "権八")
  menu_3 = Menu.create(
    name: "焼き魚定食_" + time,
    description: "資質少なめタンパク質",
    price: 900,
    picture: "/uploads/roasted_fish.jpg",
    calorie_id: calorie_id_menu_3,
    restaurant_id: restaurant_id_menu_3,
    created_at: Time.now,
    updated_at: Time.now
  )
  menu_3.categories << Category.find_by(name: "さっぱりお魚")
end
