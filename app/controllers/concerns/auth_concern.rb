# frozen_string_literal: true

module AuthConcern
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    helper_method :current_user
  end

  def authenticate_user!
    raise UnauthorizedError unless current_user
  end

  def current_user
    return @current_user if defined? @current_user

    decoded_token = decode_jwt_token
    return unless decoded_token

    expires_in = decoded_token.dig('data', 'expires_in')
    return if expires_in < Time.now.utc

    email = decoded_token.dig('data', 'email').to_s
    @current_user = User.find_by(email: email)
  end
end
