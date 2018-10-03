RSpec.describe "login/logout path", type: :helper do
  let!(:user) { FactoryBot.create(:user) }

  it "enables user to successfully log in" do
    get login_path
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    find_button('Login').click
    current_path.should == root_path # ログインフォームのpost先を指定

    # 以下、あくまで一例なので変えてね
    response.should redirect_to root_path
    expect(rendered).to have_css("p", "ログインしました")
  end

  it "enables user to successfully log out" do
    post logout_path, params: { email: user.email }
    current_path.should == root_path # ログアウトフォームのpost先を指定

    # 以下、あくまで一例なので変えてね
    response.should redirect_to root_path
    expect(rendered).to have_css("p", "ログアウトしました")
  end
end
