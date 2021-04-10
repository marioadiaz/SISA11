require "test_helper"

class TecnicosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tecnicos_new_url
    assert_response :success
  end

  test "should get index" do
    get tecnicos_index_url
    assert_response :success
  end

  test "should get show" do
    get tecnicos_show_url
    assert_response :success
  end

  test "should get create" do
    get tecnicos_create_url
    assert_response :success
  end

  test "should get edit" do
    get tecnicos_edit_url
    assert_response :success
  end

  test "should get update" do
    get tecnicos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get tecnicos_destroy_url
    assert_response :success
  end
end
