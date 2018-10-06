require 'rails_helper'

RSpec.describe Tag, type: :model do
  let!(:tag) { FactoryBot.create(:tag) }
  it "successfully adds Tag.count by one" do
    expect(Tag.count).to eq(1)
  end
end
