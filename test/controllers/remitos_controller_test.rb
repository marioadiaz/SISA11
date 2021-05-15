require "test_helper"

class RemitosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get remitos_new_url
    assert_response :success
  end

  test "should get index" do
    get remitos_index_url
    assert_response :success
  end

  test "should get show" do
    get remitos_show_url
    assert_response :success
  end

  test "should get create" do
    get remitos_create_url
    assert_response :success
  end

  test "should get edit" do
    get remitos_edit_url
    assert_response :success
  end

  test "should get update" do
    get remitos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get remitos_destroy_url
    assert_response :success
  end
end
