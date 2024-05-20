# frozen_string_literal: true

module FetchPage
  extend ActiveSupport::Concern

  included do
    def self.fetch_page(**options)
      query_chain = where(nil)
      query_chain = query_chain.page(options.fetch(:page, 1))
      query_chain = query_chain.per(options.fetch(:per, 25))
      query_chain.order(options.fetch(:order, created_at: :desc))
    end
  end
end
