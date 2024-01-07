require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top gems" do
    get top_gems_url
    assert_response :success
  end
end
