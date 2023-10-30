require "test_helper"

class CreatingMeetingPlaceRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creating_meeting_place_request = creating_meeting_place_requests(:one)
  end

  test "should get index" do
    get creating_meeting_place_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_creating_meeting_place_request_url
    assert_response :success
  end

  test "should create creating_meeting_place_request" do
    assert_difference("CreatingMeetingPlaceRequest.count") do
      post creating_meeting_place_requests_url, params: { creating_meeting_place_request: { city_name: @creating_meeting_place_request.city_name, email: @creating_meeting_place_request.email, location_details: @creating_meeting_place_request.location_details, owner_name: @creating_meeting_place_request.owner_name, stor_name: @creating_meeting_place_request.stor_name } }
    end

    assert_redirected_to creating_meeting_place_request_url(CreatingMeetingPlaceRequest.last)
  end

  test "should show creating_meeting_place_request" do
    get creating_meeting_place_request_url(@creating_meeting_place_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_creating_meeting_place_request_url(@creating_meeting_place_request)
    assert_response :success
  end

  test "should update creating_meeting_place_request" do
    patch creating_meeting_place_request_url(@creating_meeting_place_request), params: { creating_meeting_place_request: { city_name: @creating_meeting_place_request.city_name, email: @creating_meeting_place_request.email, location_details: @creating_meeting_place_request.location_details, owner_name: @creating_meeting_place_request.owner_name, stor_name: @creating_meeting_place_request.stor_name } }
    assert_redirected_to creating_meeting_place_request_url(@creating_meeting_place_request)
  end

  test "should destroy creating_meeting_place_request" do
    assert_difference("CreatingMeetingPlaceRequest.count", -1) do
      delete creating_meeting_place_request_url(@creating_meeting_place_request)
    end

    assert_redirected_to creating_meeting_place_requests_url
  end
end
