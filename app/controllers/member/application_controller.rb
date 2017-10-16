class Member::ApplicationController < ApplicationController
  include Pundit
  acts_as_token_authentication_handler_for User
  before_action :require_authentication!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def require_authentication!
    throw(:warden, scope: :user) unless current_user.presence
  end

  def after_successful_token_authentication
    # renew_authentication_token! 프로덕션에는 적용시켜야함.
    puts "Successfully authenticated #{current_user} (#{current_user.email}) via token authentication."
  end

  private

    def user_not_authorized
      response = {
          errors: {
              id: :unauthorized,
              status: 401,
              title: '요청한 유저에게 충분한 권한이 없습니다. (문제가 있다면 슬링 개발팀으로 연락주세요)'
          }
      }.to_json
      render json: response, status: 401
    end

    def record_not_found
      response = {
          errors: {
              id: :record_not_found,
              status: 404,
              title: '찾을 수 없는 자료 입니다. (문제가 있다면 슬링 개발팀으로 연락주세요)'
          }
      }.to_json
      render json: response, status: 404
    end

end
