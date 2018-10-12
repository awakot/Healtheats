require 'rails_helper'

RSpec.describe "menus/index", type: :view do

  describe "GET #index" do
    it "successfully renders template" do
      render
      expect(rendered)
    end
  end
end
