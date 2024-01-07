require "test_helper"

class GemfilesControllerTest < ActionDispatch::IntegrationTest
  include OmniauthGithubHelper

  setup do
    valid_github_login_setup
    get "/auth/github/callback"
    assert_redirected_to root_path
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
    skip "pending"

    assert_difference("Gemfile.count") do
      post gemfiles_url, params: { gemfile: { content: "gem 'rails'", app_link: "https://example.org", user_id: @gemfile.user_id } }
    end

    assert_redirected_to gemfile_url(Gemfile.order(created_at: :asc).last)
  end

  test "should show gemfile" do
    skip "pending"

    get gemfile_url(@gemfile)
    assert_response :success
  end

  test "should get edit" do
    skip "pending"

    get edit_gemfile_url(@gemfile)
    assert_response :success
  end

  test "should update gemfile" do
    skip "pending"

    patch gemfile_url(@gemfile), params: { gemfile: { content: @gemfile.content, user_id: @gemfile.user_id } }
    assert_redirected_to gemfile_url(@gemfile)
  end

  test "should destroy gemfile" do
    skip "pending"

    assert_difference("Gemfile.count", -1) do
      delete gemfile_url(@gemfile)
    end

    assert_redirected_to gemfiles_url
  end
end
