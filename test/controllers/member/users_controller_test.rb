require 'test_helper'

class Member::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get member_users_show_url
    assert_response :success
  end

end
