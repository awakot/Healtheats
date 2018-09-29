require 'rails_helper'

RSpec.describe "api/restaurants.json", type: :request do
  it "renders json" do
    get "/api/restaurants.json"    
    expect(response.status).to eq(200)
  end
end
