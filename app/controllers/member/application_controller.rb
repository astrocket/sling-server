class Member::ApplicationController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_action :require_authentication!

  def require_authentication!
    throw(:warden, scope: :user) unless current_user.presence
  end

  def after_successful_token_authentication
    # renew_authentication_token! 프로덕션에는 적용시켜야함.
    puts "Successfully authenticated #{current_user} (#{current_user.email}) via token authentication."
  end

end
