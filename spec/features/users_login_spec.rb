require 'rails_helper'

RSpec.describe "login path", type: :helper do
  let!(:user) { FactoryBot.create(:user) } # <= インスタンス変数の役割に近い、userというローカル変数のようなものを定義してくれる

  it "enables user to successfully log in" do
    get :new
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    find_button('Login').click
    current_path.should == root_path # ログインフォームのpost先を指定
    expect(rendered).to have_css("p", "ログインしました") # <= あくまで一例なので変えてね
  end

  it "enables user to successfully log out" do
    post :delete, params: { email: user.email }
    current_path.should == root_path # ログアウトフォームのpost先を指定
    expect(rendered).to have_css("p", "ログアウトしました") # <= あくまで一例なので変えてね
  end
end
