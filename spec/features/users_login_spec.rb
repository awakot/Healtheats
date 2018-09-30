require 'rails_helper'

RSpec.describe "login path", type: :request do
  let!(:user) { FactoryBot.create(:user) } # <= インスタンス変数の役割に近い、userというローカル変数のようなものを定義してくれる

  # it "login with invalid information" do
  #   get "/login"
  #   post "/login", params: { session: { email: "", password: "" } }
  #   expect(flash).to empty
  # end
  #
  # it "enables user to successfully log out" do
  #   delete "/logout", params: { email: user.email }
  #   current_path.should == root_path # ログアウトフォームのpost先を指定
  #   expect(rendered).to have_css("p", "ログアウトしました") # <= あくまで一例なので変えてね
  # end
  #
  # it "login with remembering" do
  # log_in_as(@user, remember_me: '1')
  # assert_not_empty cookies['remember_token']
  # end
  #
  # it "login without remembering" do
  # # クッキーを保存してログイン
  # log_in_as(@user, remember_me: '1')
  # delete logout_path
  # # クッキーを削除してログイン
  # log_in_as(@user, remember_me: '0')
  # assert_empty cookies['remember_token']
  # end
  #
  # it "login with valid information followed by logout" do
  #   get "/login"
  #   post "/login", params: { session: { email:    @user.email,
  #                                         password: 'password' } }
  #   expect is_logged_in?
  #   assert_redirected_to @user
  #   follow_redirect!
  #   assert_template 'users/show'
  #   assert_select "a[href=?]", login_path, count: 0
  #   assert_select "a[href=?]", logout_path
  #   assert_select "a[href=?]", user_path(@user)
  #   delete logout_path
  #   assert_not is_logged_in?
  #   follow_redirect!
  #   assert_select "a[href=?]", login_path
  #   assert_select "a[href=?]", logout_path,      count: 0
  #   assert_select "a[href=?]", user_path(@user), count: 0
  # end

end
