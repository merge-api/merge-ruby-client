# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/data_passthrough_request"
require_relative "../types/remote_response"
require "async"

module Merge
  module Hris
    class PassthroughClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Hris::PassthroughClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Pull data from an endpoint not currently supported by Merge.
      #
      # @param request [Hash] Request of type Merge::Hris::DataPassthroughRequest, as a Hash
      #   * :method (Merge::Hris::MethodEnum)
      #   * :path (String)
      #   * :base_url_override (String)
      #   * :data (String)
      #   * :multipart_form_data (Array<Merge::Hris::MultipartFormFieldRequest>)
      #   * :headers (Hash{String => Object})
      #   * :request_format (Merge::Hris::RequestFormatEnum)
      #   * :normalize_response (Boolean)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::RemoteResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.passthrough.create(request: { method: GET, path: "/scooters" })
      def create(request:, request_options: nil)
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
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/passthrough"
        end
        Merge::Hris::RemoteResponse.from_json(json_object: response.body)
      end
    end

    class AsyncPassthroughClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Hris::AsyncPassthroughClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Pull data from an endpoint not currently supported by Merge.
      #
      # @param request [Hash] Request of type Merge::Hris::DataPassthroughRequest, as a Hash
      #   * :method (Merge::Hris::MethodEnum)
      #   * :path (String)
      #   * :base_url_override (String)
      #   * :data (String)
      #   * :multipart_form_data (Array<Merge::Hris::MultipartFormFieldRequest>)
      #   * :headers (Hash{String => Object})
      #   * :request_format (Merge::Hris::RequestFormatEnum)
      #   * :normalize_response (Boolean)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::RemoteResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.passthrough.create(request: { method: GET, path: "/scooters" })
      def create(request:, request_options: nil)
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
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/passthrough"
          end
          Merge::Hris::RemoteResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
