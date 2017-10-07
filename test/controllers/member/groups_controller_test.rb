require 'test_helper'

class Member::GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member_group = member_groups(:one)
  end

  test "should get index" do
    get member_groups_url, as: :json
    assert_response :success
  end

  test "should create member_group" do
    assert_difference('Member::Group.count') do
      post member_groups_url, params: { member_group: { category: @member_group.category, name: @member_group.name, premium: @member_group.premium, user_id: @member_group.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show member_group" do
    get member_group_url(@member_group), as: :json
    assert_response :success
  end

  test "should update member_group" do
    patch member_group_url(@member_group), params: { member_group: { category: @member_group.category, name: @member_group.name, premium: @member_group.premium, user_id: @member_group.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy member_group" do
    assert_difference('Member::Group.count', -1) do
      delete member_group_url(@member_group), as: :json
    end

    assert_response 204
  end
end
