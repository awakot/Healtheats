require 'rails_helper'

RSpec.describe Calorie, type: :model do
  let!(:calorie) { FactoryBot.create(:calorie) }
  it "successfully adds Calorie.count by one" do
    expect(Calorie.count).to eq(1)
  end
end
