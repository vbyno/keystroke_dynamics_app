require 'test_helper'

class KeystrokeSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @keystroke_session = keystroke_sessions(:one)
  end

  test "should get index" do
    get keystroke_sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_keystroke_session_url
    assert_response :success
  end

  test "should create keystroke_session" do
    assert_difference('KeystrokeSession.count') do
      post keystroke_sessions_url, params: { keystroke_session: { text: @keystroke_session.text } }
    end

    assert_redirected_to keystroke_session_url(KeystrokeSession.last)
  end

  test "should show keystroke_session" do
    get keystroke_session_url(@keystroke_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_keystroke_session_url(@keystroke_session)
    assert_response :success
  end

  test "should update keystroke_session" do
    patch keystroke_session_url(@keystroke_session), params: { keystroke_session: { text: @keystroke_session.text } }
    assert_redirected_to keystroke_session_url(@keystroke_session)
  end

  test "should destroy keystroke_session" do
    assert_difference('KeystrokeSession.count', -1) do
      delete keystroke_session_url(@keystroke_session)
    end

    assert_redirected_to keystroke_sessions_url
  end
end
