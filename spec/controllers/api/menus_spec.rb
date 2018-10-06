require 'rails_helper'

RSpec.describe "api/menus.json", type: :request do
  it "renders json" do
    get "/api/menus.json"
    expect(response.status).to eq(200)
  end
end
