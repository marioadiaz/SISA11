require "test_helper"

class ClientesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get clientes_new_url
    assert_response :success
  end

  test "should get index" do
    get clientes_index_url
    assert_response :success
  end

  test "should get show" do
    get clientes_show_url
    assert_response :success
  end

  test "should get create" do
    get clientes_create_url
    assert_response :success
  end

  test "should get edit" do
    get clientes_edit_url
    assert_response :success
  end

  test "should get update" do
    get clientes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get clientes_destroy_url
    assert_response :success
  end
end
