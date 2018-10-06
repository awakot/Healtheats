require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:category) { FactoryBot.create(:category) }
  it "successfully adds Category.count by one" do
    expect(Category.count).to eq(1)
  end
end
