# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/account_details"
require "async"

module Merge
  module Filestorage
    class AccountDetailsClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Filestorage::AccountDetailsClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Get details for a linked account.
      #
      # @param request_options [RequestOptions]
      # @return [Filestorage::AccountDetails]
      def retrieve(request_options: nil)
        response = @request_client.conn.get("/api/filestorage/v1/account-details") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Filestorage::AccountDetails.from_json(json_object: response.body)
      end
    end

    class AsyncAccountDetailsClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Filestorage::AsyncAccountDetailsClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Get details for a linked account.
      #
      # @param request_options [RequestOptions]
      # @return [Filestorage::AccountDetails]
      def retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get("/api/filestorage/v1/account-details") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Filestorage::AccountDetails.from_json(json_object: response.body)
        end
      end
    end
  end
end
