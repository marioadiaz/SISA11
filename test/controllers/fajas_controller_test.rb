require "test_helper"

class FajasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get fajas_new_url
    assert_response :success
  end

  test "should get index" do
    get fajas_index_url
    assert_response :success
  end

  test "should get show" do
    get fajas_show_url
    assert_response :success
  end

  test "should get create" do
    get fajas_create_url
    assert_response :success
  end

  test "should get edit" do
    get fajas_edit_url
    assert_response :success
  end

  test "should get update" do
    get fajas_update_url
    assert_response :success
  end

  test "should get destroy" do
    get fajas_destroy_url
    assert_response :success
  end
end
