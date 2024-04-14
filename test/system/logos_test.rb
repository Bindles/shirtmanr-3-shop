require "application_system_test_case"

class LogosTest < ApplicationSystemTestCase
  setup do
    @logo = logos(:one)
  end

  test "visiting the index" do
    visit logos_url
    assert_selector "h1", text: "Logos"
  end

  test "should create logo" do
    visit logos_url
    click_on "New logo"

    fill_in "Img", with: @logo.img
    fill_in "Name", with: @logo.name
    click_on "Create Logo"

    assert_text "Logo was successfully created"
    click_on "Back"
  end

  test "should update Logo" do
    visit logo_url(@logo)
    click_on "Edit this logo", match: :first

    fill_in "Img", with: @logo.img
    fill_in "Name", with: @logo.name
    click_on "Update Logo"

    assert_text "Logo was successfully updated"
    click_on "Back"
  end

  test "should destroy Logo" do
    visit logo_url(@logo)
    click_on "Destroy this logo", match: :first

    assert_text "Logo was successfully destroyed"
  end
end
