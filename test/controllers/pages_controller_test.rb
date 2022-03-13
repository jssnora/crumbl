require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get Home" do
    get pages_home_url
    assert_response :success
  end
end
