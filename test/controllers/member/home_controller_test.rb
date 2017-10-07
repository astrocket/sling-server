require 'test_helper'

class Member::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get member_home_index_url
    assert_response :success
  end

  test "should get restricted_index" do
    get member_home_restricted_index_url
    assert_response :success
  end

end
