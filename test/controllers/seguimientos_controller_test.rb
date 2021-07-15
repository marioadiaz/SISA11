require "test_helper"

class SeguimientosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get seguimientos_new_url
    assert_response :success
  end

  test "should get index" do
    get seguimientos_index_url
    assert_response :success
  end

  test "should get show" do
    get seguimientos_show_url
    assert_response :success
  end

  test "should get create" do
    get seguimientos_create_url
    assert_response :success
  end

  test "should get edit" do
    get seguimientos_edit_url
    assert_response :success
  end

  test "should get update" do
    get seguimientos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get seguimientos_destroy_url
    assert_response :success
  end
end
