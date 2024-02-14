require "application_system_test_case"

class ChangeUserTypeRequestsTest < ApplicationSystemTestCase
  setup do
    @change_user_type_request = change_user_type_requests(:one)
  end

  test "visiting the index" do
    visit change_user_type_requests_url
    assert_selector "h1", text: "Change user type requests"
  end

  test "should create change user type request" do
    visit change_user_type_requests_url
    click_on "New change user type request"

    fill_in "User", with: @change_user_type_request.user_id
    click_on "Create Change user type request"

    assert_text "Change user type request was successfully created"
    click_on "Back"
  end

  test "should update Change user type request" do
    visit change_user_type_request_url(@change_user_type_request)
    click_on "Edit this change user type request", match: :first

    fill_in "User", with: @change_user_type_request.user_id
    click_on "Update Change user type request"

    assert_text "Change user type request was successfully updated"
    click_on "Back"
  end

  test "should destroy Change user type request" do
    visit change_user_type_request_url(@change_user_type_request)
    click_on "Destroy this change user type request", match: :first

    assert_text "Change user type request was successfully destroyed"
  end
end
