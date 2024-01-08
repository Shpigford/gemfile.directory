require "test_helper"

class GemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gems_url
    assert_response :success
  end

  test "should get show" do
    get gem_url(app_gems(:one))
    assert_response :success
  end
end
