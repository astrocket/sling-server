require 'test_helper'

class Member::NetworkControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get member_network_index_url
    assert_response :success
  end

end
