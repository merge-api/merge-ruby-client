# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/remote_key"
require "async"

module Merge
  module Hris
    class RegenerateKeyClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Hris::RegenerateKeyClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Exchange remote keys.
      #
      # @param name [String]
      # @param request_options [RequestOptions]
      # @return [Hris::RemoteKey]
      def create(name:, request_options: nil)
        response = @request_client.conn.post("/api/hris/v1/regenerate-key") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), name: name }.compact
        end
        Hris::RemoteKey.from_json(json_object: response.body)
      end
    end

    class AsyncRegenerateKeyClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Hris::AsyncRegenerateKeyClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Exchange remote keys.
      #
      # @param name [String]
      # @param request_options [RequestOptions]
      # @return [Hris::RemoteKey]
      def create(name:, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/hris/v1/regenerate-key") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), name: name }.compact
          end
          Hris::RemoteKey.from_json(json_object: response.body)
        end
      end
    end
  end
end
