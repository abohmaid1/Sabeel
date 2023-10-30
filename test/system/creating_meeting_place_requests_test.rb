require "application_system_test_case"

class CreatingMeetingPlaceRequestsTest < ApplicationSystemTestCase
  setup do
    @creating_meeting_place_request = creating_meeting_place_requests(:one)
  end

  test "visiting the index" do
    visit creating_meeting_place_requests_url
    assert_selector "h1", text: "Creating meeting place requests"
  end

  test "should create creating meeting place request" do
    visit creating_meeting_place_requests_url
    click_on "New creating meeting place request"

    fill_in "City name", with: @creating_meeting_place_request.city_name
    fill_in "Email", with: @creating_meeting_place_request.email
    fill_in "Location details", with: @creating_meeting_place_request.location_details
    fill_in "Owner name", with: @creating_meeting_place_request.owner_name
    fill_in "Stor name", with: @creating_meeting_place_request.stor_name
    click_on "Create Creating meeting place request"

    assert_text "Creating meeting place request was successfully created"
    click_on "Back"
  end

  test "should update Creating meeting place request" do
    visit creating_meeting_place_request_url(@creating_meeting_place_request)
    click_on "Edit this creating meeting place request", match: :first

    fill_in "City name", with: @creating_meeting_place_request.city_name
    fill_in "Email", with: @creating_meeting_place_request.email
    fill_in "Location details", with: @creating_meeting_place_request.location_details
    fill_in "Owner name", with: @creating_meeting_place_request.owner_name
    fill_in "Stor name", with: @creating_meeting_place_request.stor_name
    click_on "Update Creating meeting place request"

    assert_text "Creating meeting place request was successfully updated"
    click_on "Back"
  end

  test "should destroy Creating meeting place request" do
    visit creating_meeting_place_request_url(@creating_meeting_place_request)
    click_on "Destroy this creating meeting place request", match: :first

    assert_text "Creating meeting place request was successfully destroyed"
  end
end
