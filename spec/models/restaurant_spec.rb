require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let!(:restaurant) { FactoryBot.create(:restaurant) }
  it "successfully adds Restaurant.count by one" do
    expect(Restaurant.count).to eq(1)
  end
end
