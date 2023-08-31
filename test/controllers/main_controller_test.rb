require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get main_index_url
    assert_response :success
  end

  test "should get abou_us" do
    get main_abou_us_url
    assert_response :success
  end
end
