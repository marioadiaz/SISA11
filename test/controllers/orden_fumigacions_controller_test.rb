require "test_helper"

class OrdenFumigacionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get orden_fumigacions_new_url
    assert_response :success
  end

  test "should get index" do
    get orden_fumigacions_index_url
    assert_response :success
  end

  test "should get show" do
    get orden_fumigacions_show_url
    assert_response :success
  end

  test "should get create" do
    get orden_fumigacions_create_url
    assert_response :success
  end

  test "should get edit" do
    get orden_fumigacions_edit_url
    assert_response :success
  end

  test "should get update" do
    get orden_fumigacions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get orden_fumigacions_destroy_url
    assert_response :success
  end
end
