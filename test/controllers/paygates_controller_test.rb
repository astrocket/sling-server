require 'test_helper'

class PaygatesControllerTest < ActionDispatch::IntegrationTest
  test "should get payform" do
    get paygates_payform_url
    assert_response :success
  end

  test "should get gateway" do
    get paygates_gateway_url
    assert_response :success
  end

  test "should get create" do
    get paygates_create_url
    assert_response :success
  end

end
