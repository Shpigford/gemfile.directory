require "application_system_test_case"

class HomePageTest < ApplicationSystemTestCase
  test "visiting the home page" do
    visit root_path
    assert_selector "h1", text: "Most Popular Gemfiles"
  end
end
