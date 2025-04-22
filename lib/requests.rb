# frozen_string_literal: true

require_relative "environment"
require "faraday"
require "faraday/multipart"
require "faraday/retry"
require "async/http/faraday"

module Merge
  class RequestClient
    # @return [Faraday]
    attr_reader :conn
    # @return [String]
    attr_reader :base_url
    # @return [String]
    attr_reader :api_key
    # @return [String]
    attr_reader :default_environment

    # @param base_url [String]
    # @param environment [Merge::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @param account_token [String] Token identifying the end user.
    # @return [Merge::RequestClient]
    def initialize(api_key:, base_url: nil, environment: Merge::Environment::PRODUCTION, max_retries: nil,
                   timeout_in_seconds: nil, account_token: nil)
      @default_environment = environment
      @base_url = environment || base_url
      @api_key = "Bearer #{api_key}"
      @headers = {}
      @headers["X-Account-Token"] = account_token unless account_token.nil?
      @conn = Faraday.new(headers: @headers) do |faraday|
        faraday.request :multipart
        faraday.request :json
        faraday.response :raise_error, include_request: true
        faraday.request :retry, { max: max_retries } unless max_retries.nil?
        faraday.options.timeout = timeout_in_seconds unless timeout_in_seconds.nil?
      end
    end

    # @param request_options [Merge::RequestOptions]
    # @return [String]
    def get_url(request_options: nil)
      request_options&.base_url || @default_environment || @base_url
    end

    # @return [Hash{String => String}]
    def get_headers
      headers = { "X-Fern-Language": "Ruby", "X-Fern-SDK-Name": "merge_ruby_client", "X-Fern-SDK-Version": "1.1.0" }
      headers["Authorization"] = ((@api_key.is_a? Method) ? @api_key.call : @api_key) unless @api_key.nil?
      headers
    end
  end

  class AsyncRequestClient
    # @return [Faraday]
    attr_reader :conn
    # @return [String]
    attr_reader :base_url
    # @return [String]
    attr_reader :api_key
    # @return [String]
    attr_reader :default_environment

    # @param base_url [String]
    # @param environment [Merge::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @param account_token [String] Token identifying the end user.
    # @return [Merge::AsyncRequestClient]
    def initialize(api_key:, base_url: nil, environment: Merge::Environment::PRODUCTION, max_retries: nil,
                   timeout_in_seconds: nil, account_token: nil)
      @default_environment = environment
      @base_url = environment || base_url
      @api_key = "Bearer #{api_key}"
      @headers = {}
      @headers["X-Account-Token"] = account_token unless account_token.nil?
      @conn = Faraday.new(headers: @headers) do |faraday|
        faraday.request :multipart
        faraday.request :json
        faraday.response :raise_error, include_request: true
        faraday.adapter :async_http
        faraday.request :retry, { max: max_retries } unless max_retries.nil?
        faraday.options.timeout = timeout_in_seconds unless timeout_in_seconds.nil?
      end
    end

    # @param request_options [Merge::RequestOptions]
    # @return [String]
    def get_url(request_options: nil)
      request_options&.base_url || @default_environment || @base_url
    end

    # @return [Hash{String => String}]
    def get_headers
      headers = { "X-Fern-Language": "Ruby", "X-Fern-SDK-Name": "merge_ruby_client", "X-Fern-SDK-Version": "1.1.0" }
      headers["Authorization"] = ((@api_key.is_a? Method) ? @api_key.call : @api_key) unless @api_key.nil?
      headers
    end
  end

  # Additional options for request-specific configuration when calling APIs via the
  #  SDK.
  class RequestOptions
    # @return [String]
    attr_reader :base_url
    # @return [String]
    attr_reader :api_key
    # @return [String] Token identifying the end user.
    attr_reader :account_token
    # @return [Hash{String => Object}]
    attr_reader :additional_headers
    # @return [Hash{String => Object}]
    attr_reader :additional_query_parameters
    # @return [Hash{String => Object}]
    attr_reader :additional_body_parameters
    # @return [Long]
    attr_reader :timeout_in_seconds

    # @param base_url [String]
    # @param api_key [String]
    # @param account_token [String] Token identifying the end user.
    # @param additional_headers [Hash{String => Object}]
    # @param additional_query_parameters [Hash{String => Object}]
    # @param additional_body_parameters [Hash{String => Object}]
    # @param timeout_in_seconds [Long]
    # @return [Merge::RequestOptions]
    def initialize(base_url: nil, api_key: nil, account_token: nil, additional_headers: nil,
                   additional_query_parameters: nil, additional_body_parameters: nil, timeout_in_seconds: nil)
      @base_url = base_url
      @api_key = api_key
      @account_token = account_token
      @additional_headers = additional_headers
      @additional_query_parameters = additional_query_parameters
      @additional_body_parameters = additional_body_parameters
      @timeout_in_seconds = timeout_in_seconds
    end
  end

  # Additional options for request-specific configuration when calling APIs via the
  #  SDK.
  class IdempotencyRequestOptions
    # @return [String]
    attr_reader :base_url
    # @return [String]
    attr_reader :api_key
    # @return [String] Token identifying the end user.
    attr_reader :account_token
    # @return [Hash{String => Object}]
    attr_reader :additional_headers
    # @return [Hash{String => Object}]
    attr_reader :additional_query_parameters
    # @return [Hash{String => Object}]
    attr_reader :additional_body_parameters
    # @return [Long]
    attr_reader :timeout_in_seconds

    # @param base_url [String]
    # @param api_key [String]
    # @param account_token [String] Token identifying the end user.
    # @param additional_headers [Hash{String => Object}]
    # @param additional_query_parameters [Hash{String => Object}]
    # @param additional_body_parameters [Hash{String => Object}]
    # @param timeout_in_seconds [Long]
    # @return [Merge::IdempotencyRequestOptions]
    def initialize(base_url: nil, api_key: nil, account_token: nil, additional_headers: nil,
                   additional_query_parameters: nil, additional_body_parameters: nil, timeout_in_seconds: nil)
      @base_url = base_url
      @api_key = api_key
      @account_token = account_token
      @additional_headers = additional_headers
      @additional_query_parameters = additional_query_parameters
      @additional_body_parameters = additional_body_parameters
      @timeout_in_seconds = timeout_in_seconds
    end
  end
end
