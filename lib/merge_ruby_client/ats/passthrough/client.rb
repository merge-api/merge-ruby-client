# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/data_passthrough_request"
require_relative "../types/remote_response"
require "async"

module Merge
  module Ats
    class PassthroughClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Ats::PassthroughClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Pull data from an endpoint not currently supported by Merge.
      #
      # @param request [Hash] Request of type Ats::DataPassthroughRequest, as a Hash
      #   * :method (METHOD_ENUM)
      #   * :path (String)
      #   * :base_url_override (String)
      #   * :data (String)
      #   * :multipart_form_data (Array<Ats::MultipartFormFieldRequest>)
      #   * :headers (Hash{String => String})
      #   * :request_format (REQUEST_FORMAT_ENUM)
      #   * :normalize_response (Boolean)
      # @param request_options [RequestOptions]
      # @return [Ats::RemoteResponse]
      def create(request:, request_options: nil)
        response = @request_client.conn.post("/api/ats/v1/passthrough") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        end
        Ats::RemoteResponse.from_json(json_object: response.body)
      end
    end

    class AsyncPassthroughClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Ats::AsyncPassthroughClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Pull data from an endpoint not currently supported by Merge.
      #
      # @param request [Hash] Request of type Ats::DataPassthroughRequest, as a Hash
      #   * :method (METHOD_ENUM)
      #   * :path (String)
      #   * :base_url_override (String)
      #   * :data (String)
      #   * :multipart_form_data (Array<Ats::MultipartFormFieldRequest>)
      #   * :headers (Hash{String => String})
      #   * :request_format (REQUEST_FORMAT_ENUM)
      #   * :normalize_response (Boolean)
      # @param request_options [RequestOptions]
      # @return [Ats::RemoteResponse]
      def create(request:, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/ats/v1/passthrough") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          Ats::RemoteResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
