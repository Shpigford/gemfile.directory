require "test_helper"

class GemfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gemfile = gemfiles(:one)
  end

  test "should get index" do
    get gemfiles_url
    assert_response :success
  end

  test "should get new" do
    get new_gemfile_url
    assert_response :success
  end

  test "should create gemfile" do
    assert_difference("Gemfile.count") do
      post gemfiles_url, params: { gemfile: { content: @gemfile.content, user_id: @gemfile.user_id } }
    end

    assert_redirected_to gemfile_url(Gemfile.last)
  end

  test "should show gemfile" do
    get gemfile_url(@gemfile)
    assert_response :success
  end

  test "should get edit" do
    get edit_gemfile_url(@gemfile)
    assert_response :success
  end

  test "should update gemfile" do
    patch gemfile_url(@gemfile), params: { gemfile: { content: @gemfile.content, user_id: @gemfile.user_id } }
    assert_redirected_to gemfile_url(@gemfile)
  end

  test "should destroy gemfile" do
    assert_difference("Gemfile.count", -1) do
      delete gemfile_url(@gemfile)
    end

    assert_redirected_to gemfiles_url
  end
end
