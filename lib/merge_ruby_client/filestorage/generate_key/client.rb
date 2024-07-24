# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/remote_key"
require "async"

module Merge
  module Filestorage
    class GenerateKeyClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Filestorage::GenerateKeyClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Create a remote key.
      #
      # @param name [String] The name of the remote key
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::RemoteKey]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.generate_key.create(name: "Remote Deployment Key 1")
      def create(name:, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = { **(request_options&.additional_body_parameters || {}), name: name }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/generate-key"
        end
        Merge::Filestorage::RemoteKey.from_json(json_object: response.body)
      end
    end

    class AsyncGenerateKeyClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Filestorage::AsyncGenerateKeyClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Create a remote key.
      #
      # @param name [String] The name of the remote key
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::RemoteKey]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.generate_key.create(name: "Remote Deployment Key 1")
      def create(name:, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            req.body = { **(request_options&.additional_body_parameters || {}), name: name }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/generate-key"
          end
          Merge::Filestorage::RemoteKey.from_json(json_object: response.body)
        end
      end
    end
  end
end
