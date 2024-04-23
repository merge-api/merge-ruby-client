# frozen_string_literal: true

require_relative "../../../requests"
require "async"

module Merge
  module Filestorage
    class DeleteAccountClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Filestorage::DeleteAccountClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Delete a linked account.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Void]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.delete
      def delete(request_options: nil)
        @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/delete-account"
        end
      end
    end

    class AsyncDeleteAccountClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Filestorage::AsyncDeleteAccountClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Delete a linked account.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Void]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.delete
      def delete(request_options: nil)
        Async do
          @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/delete-account"
          end
        end
      end
    end
  end
end
