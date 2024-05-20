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

  def paginated_response(data, status: 200)
    render json: {
      message: 'success',
      status:,
      data: {
        items: data,
        pagination: {
          current_page: data.current_page,
          total_pages: data.total_pages,
          total_items: data.total_count,
          limit_per_page: data.limit_value
        }
      }
    }
  end
end
