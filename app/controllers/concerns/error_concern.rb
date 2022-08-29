# frozen_string_literal: true

module ErrorConcern
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
    rescue_from UnauthorizedError, with: :error_unauthorized
    rescue_from ParameterError, with: :error_parameter
    rescue_from UnprocessableEntityError, with: :error_unprocessable_entity
    rescue_from ActiveRecord::RecordInvalid, with: :error_unprocessable_entity
    rescue_from ActiveRecord::RecordNotUnique, with: :error_not_unique
    rescue_from ActiveRecord::NotNullViolation, with: :error_unprocessable_entity
    rescue_from ActionController::ParameterMissing, with: :error_missing_parameter
  end

  protected

  def error_unauthorized
    render_api_error('unauthorized', :unauthorized)
  end

  def error_not_found(message)
    render_api_error(message, :not_found)
  end

  def error_parameter(exception)
    render_api_error(exception.message, :unprocessable_entity)
  end

  def error_missing_parameter(exception)
    render_api_error(exception.message, :unprocessable_entity)
  end

  def error_unprocessable_entity(exception)
    render_api_error(exception.message, :unprocessable_entity)
  end

  def error_not_unique(exception)
    render_api_error(exception.message, :unprocessable_entity)
  end

  def render_api_error(message, status)
    render json: { error: message, status: Rack::Utils.status_code(status) }, status: status
  end
end
