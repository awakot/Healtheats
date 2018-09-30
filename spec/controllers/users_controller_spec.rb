require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "should redirect index when not logged in" do
<<<<<<< HEAD
      get "index"
      expect(response).to redirect_to login_url
=======
      get :index
      expect(response).to redirected_to login_url
>>>>>>> 8463737d9f8ee74b65e536727a416219a815fda3
    end
  end

end
