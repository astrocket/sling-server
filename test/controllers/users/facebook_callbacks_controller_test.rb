require 'test_helper'

class Users::FacebookCallbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get facebook" do
    get users_facebook_callbacks_facebook_url
    assert_response :success
  end

end
