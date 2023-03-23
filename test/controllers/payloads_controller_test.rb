require "test_helper"

class PayloadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get payloads_index_url
    assert_response :success
  end
end
