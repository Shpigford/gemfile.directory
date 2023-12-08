require "application_system_test_case"

class GemfilesTest < ApplicationSystemTestCase
  setup do
    @gemfile = gemfiles(:one)
  end

  test "visiting the index" do
    visit gemfiles_url
    assert_selector "h1", text: "Gemfiles"
  end

  test "should create gemfile" do
    visit gemfiles_url
    click_on "New gemfile"

    fill_in "Content", with: @gemfile.content
    fill_in "User", with: @gemfile.user_id
    click_on "Create Gemfile"

    assert_text "Gemfile was successfully created"
    click_on "Back"
  end

  test "should update Gemfile" do
    visit gemfile_url(@gemfile)
    click_on "Edit this gemfile", match: :first

    fill_in "Content", with: @gemfile.content
    fill_in "User", with: @gemfile.user_id
    click_on "Update Gemfile"

    assert_text "Gemfile was successfully updated"
    click_on "Back"
  end

  test "should destroy Gemfile" do
    visit gemfile_url(@gemfile)
    click_on "Destroy this gemfile", match: :first

    assert_text "Gemfile was successfully destroyed"
  end
end
