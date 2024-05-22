# frozen_string_literal: true

module ErrorHandlers
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_response
    rescue_from ActionController::ParameterMissing, with: :param_missing_response
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response
    rescue_from Pundit::NotAuthorizedError, with: :not_authorized_response
  end

  def record_invalid_response(error)
    error_response(422, error.record.errors.full_messages)
  end

  def record_not_found_response(_error)
    error_response(404, 'Record not found.')
  end

  def param_missing_response(error)
    error_response(400, error.message)
  end

  def not_authorized_response(_error)
    error_response(403, 'User is not authorized.')
  end

  private

  def error_response(status, errors)
    render json: {
      status:,
      message: 'error',
      errors:
    }, status:
  end
end
