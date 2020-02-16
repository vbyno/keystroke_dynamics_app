require "application_system_test_case"

class KeystrokeSessionsTest < ApplicationSystemTestCase
  setup do
    @keystroke_session = keystroke_sessions(:one)
  end

  test "visiting the index" do
    visit keystroke_sessions_url
    assert_selector "h1", text: "Keystroke Sessions"
  end

  test "creating a Keystroke session" do
    visit keystroke_sessions_url
    click_on "New Keystroke Session"

    fill_in "text", with: @keystroke_session.text
    click_on "Create Keystroke session"

    assert_text "Keystroke session was successfully created"
    click_on "Back"
  end

  test "updating a Keystroke session" do
    visit keystroke_sessions_url
    click_on "Edit", match: :first

    fill_in "text", with: @keystroke_session.text
    click_on "Update Keystroke session"

    assert_text "Keystroke session was successfully updated"
    click_on "Back"
  end

  test "destroying a Keystroke session" do
    visit keystroke_sessions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Keystroke session was successfully destroyed"
  end
end
