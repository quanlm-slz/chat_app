# frozen_string_literal: true

module ResponseHandlers
  extend ActiveSupport::Concern

  def success_response(data, status: 200)
    render json: {
      message: 'success',
      status:,
      data: ActiveModelSerializers::SerializableResource.new(data)
    }
  end

  def no_content_response(status: 204)
    render json: {
      message: 'success',
      status:
    }
  end
end
