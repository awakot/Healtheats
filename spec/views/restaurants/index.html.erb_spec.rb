require 'rails_helper'

RSpec.describe "restaurants/index", type: :view do
  it "shows restaurants list" do
    render
    expect(rendered).to have_css("h1", text: "店舗一覧")
    # TODO: Reactをテストしたいけど無理そう ><
  end
end
