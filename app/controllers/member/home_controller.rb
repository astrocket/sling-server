class Member::HomeController < Member::ApplicationController

  def index
    message = current_user.presence ? "You are successfully authenticated! to restricted area" : 'If you see this message, authentication is not required.'
    render json: { current_user: current_user.try(:email), message: message }
  end

end
