require 'test_helper'

class Admin::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get inde" do
    get admin_items_inde_url
    assert_response :success
  end

  test "should get show" do
    get admin_items_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_items_edit_url
    assert_response :success
  end

end
