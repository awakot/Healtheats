require 'rails_helper'

RSpec.describe Api::RestaurantsController, type: :controller do
  it "renders json" do
    get "/api/restaurants.json"
    expect(response.status).to eq(200)
  end
end
