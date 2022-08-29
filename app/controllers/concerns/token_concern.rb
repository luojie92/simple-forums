# frozen_string_literal: true

module TokenConcern
  extend ActiveSupport::Concern

  def encode_jwt_token(resource, expire_time)
    payload = {
      data: {
        id: resource.id,
        email: resource.email,
        expires_in: expire_time
      }
    }

    JWT.encode payload, ENV['HMAC_SECRET'], 'HS256'
  end

  def decode_jwt_token
    return unless request.headers['Authorization']

    bear_token = request.headers['Authorization'].split(' ').last
    JWT.decode(bear_token, ENV['HMAC_SECRET'], true, algorithm: 'HS256').first
  rescue JWT::DecodeError => e
    Rails.logger.error "#{e.class.name} (#{e.message}):"
    Rails.logger.error e.backtrace.join("\n")
    nil
  end
end
