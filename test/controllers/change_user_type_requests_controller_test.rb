require "test_helper"

class ChangeUserTypeRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @change_user_type_request = change_user_type_requests(:one)
  end

  test "should get index" do
    get change_user_type_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_change_user_type_request_url
    assert_response :success
  end

  test "should create change_user_type_request" do
    assert_difference("ChangeUserTypeRequest.count") do
      post change_user_type_requests_url, params: { change_user_type_request: { user_id: @change_user_type_request.user_id } }
    end

    assert_redirected_to change_user_type_request_url(ChangeUserTypeRequest.last)
  end

  test "should show change_user_type_request" do
    get change_user_type_request_url(@change_user_type_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_change_user_type_request_url(@change_user_type_request)
    assert_response :success
  end

  test "should update change_user_type_request" do
    patch change_user_type_request_url(@change_user_type_request), params: { change_user_type_request: { user_id: @change_user_type_request.user_id } }
    assert_redirected_to change_user_type_request_url(@change_user_type_request)
  end

  test "should destroy change_user_type_request" do
    assert_difference("ChangeUserTypeRequest.count", -1) do
      delete change_user_type_request_url(@change_user_type_request)
    end

    assert_redirected_to change_user_type_requests_url
  end
end
