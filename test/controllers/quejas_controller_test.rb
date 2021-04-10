require "test_helper"

class QuejasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get quejas_new_url
    assert_response :success
  end

  test "should get index" do
    get quejas_index_url
    assert_response :success
  end

  test "should get show" do
    get quejas_show_url
    assert_response :success
  end

  test "should get create" do
    get quejas_create_url
    assert_response :success
  end

  test "should get edit" do
    get quejas_edit_url
    assert_response :success
  end

  test "should get update" do
    get quejas_update_url
    assert_response :success
  end

  test "should get destroy" do
    get quejas_destroy_url
    assert_response :success
  end
end
