#
class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  private

  def authenticated?
    authenticate_or_request_with_http_basic do |username, password|
      User.where(username: username, password: password).exists?
    end
  end
end
