class V1::RegistrationsController < ApplicationController
  def create
    account = Account.new(account_params)
    if account.save
      payload = {account_id: account.id}
      token = Auth.issue(payload)
      render json: {jwt: token}
    else
      render json: {errors: account.errors}, status: 401
    end
  end


  private
  def account_params
    params.require(:account).permit(:username, :password)
  end

  class Auth
    SECRET = Rails.application.secrets.jwt_secret

    def self.issue(payload)
      JWT.encode(payload, SECRET)
    end

    def self.decode(token)
      JWT.decode(token, SECRET).first
    end
  end

end
