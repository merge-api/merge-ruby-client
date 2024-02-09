# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/account_token"
require "async"

module Merge
  module Filestorage
    class AccountTokenClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Filestorage::AccountTokenClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns the account token for the end user with the provided public token.
      #
      # @param public_token [String]
      # @param request_options [RequestOptions]
      # @return [Filestorage::AccountToken]
      def retrieve(public_token:, request_options: nil)
        response = @request_client.conn.get("/api/filestorage/v1/account-token/#{public_token}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Filestorage::AccountToken.from_json(json_object: response.body)
      end
    end

    class AsyncAccountTokenClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Filestorage::AsyncAccountTokenClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns the account token for the end user with the provided public token.
      #
      # @param public_token [String]
      # @param request_options [RequestOptions]
      # @return [Filestorage::AccountToken]
      def retrieve(public_token:, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/filestorage/v1/account-token/#{public_token}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Filestorage::AccountToken.from_json(json_object: response.body)
        end
      end
    end
  end
end
