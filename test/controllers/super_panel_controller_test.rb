require 'test_helper'

class SuperPanelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get super_panel_index_url
    assert_response :success
  end

end
