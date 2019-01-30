require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get ping" do
    get api_ping_url
    assert_response :success
  end

end
