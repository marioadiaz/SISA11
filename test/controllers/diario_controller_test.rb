require "test_helper"

class DiarioControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get diario_index_url
    assert_response :success
  end
end
