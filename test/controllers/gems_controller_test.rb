require "test_helper"

class GemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gems_index_url
    assert_response :success
  end

  test "should get show" do
    get gems_show_url
    assert_response :success
  end
end
