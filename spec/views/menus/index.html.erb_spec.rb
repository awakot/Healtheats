require 'rails_helper'

RSpec.describe "menus/index", type: :view do
  it "shows sample strings" do
    # TODO: Reactをテストする
    render
    expect(rendered)
  end
end
