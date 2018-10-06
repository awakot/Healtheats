require 'rails_helper'

RSpec.describe Menu, type: :model do
  let!(:restaurant) { FactoryBot.create(:restaurant) }
  let!(:calorie) { FactoryBot.create(:calorie) }
  let!(:menu) { FactoryBot.create(:menu,
                                  calorie_id: calorie.id,
                                  restaurant_id: restaurant.id) }

  it "successfully adds Menu.count by one" do
    expect(Menu.count).to eq(1)
  end

  it "successfully associates menu to calorie, restaurant, tag and category" do
    expect(restaurant.menus.count).to eq(1)
    expect(calorie.menus.count).to eq(1)
    # TODO: tag, categoryのテスト
  end
end
