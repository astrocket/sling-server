class HomeController < ApplicationController

  def index
    message = 'Welcome! No authentication is required.'
    render json: { message: message }
  end

end
