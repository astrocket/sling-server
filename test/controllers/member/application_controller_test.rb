require 'test_helper'

class Member::ApplicationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get member_application_index_url
    assert_response :success
  end

  test "should get restricted_index" do
    get member_application_restricted_index_url
    assert_response :success
  end

end
