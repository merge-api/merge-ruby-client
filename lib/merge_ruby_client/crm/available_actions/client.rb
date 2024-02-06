# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/available_actions"
require "async"

module Merge
  module Crm
    class AvailableActionsClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Crm::AvailableActionsClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of models and actions available for an account.
      #
      # @param request_options [RequestOptions]
      # @return [Crm::AvailableActions]
      def retrieve(request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/available-actions") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Crm::AvailableActions.from_json(json_object: response.body)
      end
    end

    class AsyncAvailableActionsClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Crm::AsyncAvailableActionsClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of models and actions available for an account.
      #
      # @param request_options [RequestOptions]
      # @return [Crm::AvailableActions]
      def retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/available-actions") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Crm::AvailableActions.from_json(json_object: response.body)
        end
      end
    end
  end
end
