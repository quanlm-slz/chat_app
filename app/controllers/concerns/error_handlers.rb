# frozen_string_literal: true

module ErrorHandlers
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_response
  end

  def record_invalid_response(error)
    error_response(422, error.record.errors.full_messages)
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
