require 'rails_helper'

RSpec.describe "restaurants/index", type: :view do

  describe "GET #index" do
    it "shows sample strings" do
      render
      expect(rendered).to have_css(".restaurantbox-list__item")
    end
  end
end
