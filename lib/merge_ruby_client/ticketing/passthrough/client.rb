# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/data_passthrough_request"
require_relative "../types/remote_response"
require "async"

module Merge
  module Ticketing
    class PassthroughClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Ticketing::PassthroughClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Pull data from an endpoint not currently supported by Merge.
      #
      # @param request [Hash] Request of type Merge::Ticketing::DataPassthroughRequest, as a Hash
      #   * :method (Merge::Ticketing::MethodEnum)
      #   * :path (String)
      #   * :base_url_override (String)
      #   * :data (String)
      #   * :multipart_form_data (Array<Merge::Ticketing::MultipartFormFieldRequest>)
      #   * :headers (Hash{String => Object})
      #   * :request_format (Merge::Ticketing::RequestFormatEnum)
      #   * :normalize_response (Boolean)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::RemoteResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.create(request: { method: GET, path: "/scooters" })
      def create(request:, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/passthrough"
        end
        Merge::Ticketing::RemoteResponse.from_json(json_object: response.body)
      end
    end

    class AsyncPassthroughClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Ticketing::AsyncPassthroughClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Pull data from an endpoint not currently supported by Merge.
      #
      # @param request [Hash] Request of type Merge::Ticketing::DataPassthroughRequest, as a Hash
      #   * :method (Merge::Ticketing::MethodEnum)
      #   * :path (String)
      #   * :base_url_override (String)
      #   * :data (String)
      #   * :multipart_form_data (Array<Merge::Ticketing::MultipartFormFieldRequest>)
      #   * :headers (Hash{String => Object})
      #   * :request_format (Merge::Ticketing::RequestFormatEnum)
      #   * :normalize_response (Boolean)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::RemoteResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.create(request: { method: GET, path: "/scooters" })
      def create(request:, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/passthrough"
          end
          Merge::Ticketing::RemoteResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
