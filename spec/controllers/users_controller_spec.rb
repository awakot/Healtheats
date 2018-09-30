require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "should redirect index when not logged in" do
      get :index
      expect(response).to redirected_to login_url
    end
  end

end
