require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  setup do
  end

  test "should get index" do
    get "/"
    assert_response :success
    assert_includes @response.body, "hello"
  end
end
