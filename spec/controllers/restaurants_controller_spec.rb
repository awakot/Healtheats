require 'rails_helper'

RSpec.describe "restaurants/index", type: :view do

  describe "GET #index" do
    it "shows sample strings" do
      render
      expect(rendered)
    end
  end
end

# TODO: menus_controller_spec
