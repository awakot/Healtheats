require 'rails_helper'

RSpec.describe "restaurants/index", type: :view do

  describe "GET #index" do
    it "shows sample strings", js: true do
      render
      expect(rendered).to have_css("h1", text: "店舗一覧")
    end
  end
end

# TODO: menus_controller_spec
