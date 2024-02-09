# frozen_string_literal: true

require_relative "../../../requests"
require "async"

module Merge
  module Hris
    class DeleteAccountClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Hris::DeleteAccountClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Delete a linked account.
      #
      # @param request_options [RequestOptions]
      # @return [Void]
      def delete(request_options: nil)
        @request_client.conn.post("/api/hris/v1/delete-account") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
      end
    end

    class AsyncDeleteAccountClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Hris::AsyncDeleteAccountClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Delete a linked account.
      #
      # @param request_options [RequestOptions]
      # @return [Void]
      def delete(request_options: nil)
        Async do
          @request_client.conn.post("/api/hris/v1/delete-account") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
        end
      end
    end
  end
end
