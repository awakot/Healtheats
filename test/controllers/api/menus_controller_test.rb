require 'test_helper'

class Api::MenusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_menus_index_url
    assert_response :success
  end

end
