require "test_helper"

class PresenceControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get presence_update_url
    assert_response :success
  end
end
