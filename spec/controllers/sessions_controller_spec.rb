require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET login_path" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end





end
