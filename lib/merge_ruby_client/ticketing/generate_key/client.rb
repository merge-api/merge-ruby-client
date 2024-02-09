# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/remote_key"
require "async"

module Merge
  module Ticketing
    class GenerateKeyClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Ticketing::GenerateKeyClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Create a remote key.
      #
      # @param name [String]
      # @param request_options [RequestOptions]
      # @return [Ticketing::RemoteKey]
      def create(name:, request_options: nil)
        response = @request_client.conn.post("/api/ticketing/v1/generate-key") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), name: name }.compact
        end
        Ticketing::RemoteKey.from_json(json_object: response.body)
      end
    end

    class AsyncGenerateKeyClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Ticketing::AsyncGenerateKeyClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Create a remote key.
      #
      # @param name [String]
      # @param request_options [RequestOptions]
      # @return [Ticketing::RemoteKey]
      def create(name:, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/ticketing/v1/generate-key") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), name: name }.compact
          end
          Ticketing::RemoteKey.from_json(json_object: response.body)
        end
      end
    end
  end
end
