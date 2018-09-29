require 'rails_helper'

RSpec.describe "menus/index", type: :view do
  it "shows restaurants list" do
    # TODO: Reactをテストする
    render
    expect(rendered)
  end
end
