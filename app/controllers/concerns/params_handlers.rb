# frozen_string_literal: true

module ParamsHandlers
  include ActiveSupport::Concern

  def index_params
    params.permit(:page, :per, :order)
  end
end
