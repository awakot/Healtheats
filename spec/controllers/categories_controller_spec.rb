require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end

# TODO: categories_controller_spec
