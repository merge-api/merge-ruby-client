# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/data_passthrough_request"
require_relative "../types/async_passthrough_reciept"
require_relative "../types/remote_response"
require "async"

module Merge
  module Accounting
    class AsyncPassthroughClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Accounting::AsyncPassthroughClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Asynchronously pull data from an endpoint not currently supported by Merge.
      #
      # @param request [Hash] Request of type Accounting::DataPassthroughRequest, as a Hash
      #   * :method (METHOD_ENUM)
      #   * :path (String)
      #   * :base_url_override (String)
      #   * :data (String)
      #   * :multipart_form_data (Array<Accounting::MultipartFormFieldRequest>)
      #   * :headers (Hash{String => String})
      #   * :request_format (REQUEST_FORMAT_ENUM)
      #   * :normalize_response (Boolean)
      # @param request_options [RequestOptions]
      # @return [Accounting::AsyncPassthroughReciept]
      def create(request:, request_options: nil)
        response = @request_client.conn.post("/api/accounting/v1/async-passthrough") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        end
        Accounting::AsyncPassthroughReciept.from_json(json_object: response.body)
      end

      # Retrieves data from earlier async-passthrough POST request
      #
      # @param async_passthrough_receipt_id [String]
      # @param request_options [RequestOptions]
      # @return [Accounting::RemoteResponse]
      def retrieve(async_passthrough_receipt_id:, request_options: nil)
        response = @request_client.conn.get("/api/accounting/v1/async-passthrough/#{async_passthrough_receipt_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Accounting::RemoteResponse.from_json(json_object: response.body)
      end
    end

    class AsyncAsyncPassthroughClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Accounting::AsyncAsyncPassthroughClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Asynchronously pull data from an endpoint not currently supported by Merge.
      #
      # @param request [Hash] Request of type Accounting::DataPassthroughRequest, as a Hash
      #   * :method (METHOD_ENUM)
      #   * :path (String)
      #   * :base_url_override (String)
      #   * :data (String)
      #   * :multipart_form_data (Array<Accounting::MultipartFormFieldRequest>)
      #   * :headers (Hash{String => String})
      #   * :request_format (REQUEST_FORMAT_ENUM)
      #   * :normalize_response (Boolean)
      # @param request_options [RequestOptions]
      # @return [Accounting::AsyncPassthroughReciept]
      def create(request:, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/accounting/v1/async-passthrough") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          Accounting::AsyncPassthroughReciept.from_json(json_object: response.body)
        end
      end

      # Retrieves data from earlier async-passthrough POST request
      #
      # @param async_passthrough_receipt_id [String]
      # @param request_options [RequestOptions]
      # @return [Accounting::RemoteResponse]
      def retrieve(async_passthrough_receipt_id:, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/accounting/v1/async-passthrough/#{async_passthrough_receipt_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Accounting::RemoteResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
