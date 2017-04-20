class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  #before_action :authenticate

  def authenticate
    render json: {error: "Unauthorized"}, status: 401 unless logged_in?
  end

  def logged_in?
    byebug
    authenticate_or_request_with_http_token do |token, options|
      byebug
      Account.from_token(token)
    end
  end
end
