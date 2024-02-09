# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/accounting_phone_number"
require "async"

module Merge
  module Accounting
    class PhoneNumbersClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Accounting::PhoneNumbersClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns an `AccountingPhoneNumber` object with the given `id`.
      #
      # @param id [String]
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Accounting::AccountingPhoneNumber]
      def retrieve(id:, include_remote_data: nil, request_options: nil)
        response = @request_client.conn.get("/api/accounting/v1/phone-numbers/#{id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "include_remote_data": include_remote_data
          }.compact
        end
        Accounting::AccountingPhoneNumber.from_json(json_object: response.body)
      end
    end

    class AsyncPhoneNumbersClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Accounting::AsyncPhoneNumbersClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns an `AccountingPhoneNumber` object with the given `id`.
      #
      # @param id [String]
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Accounting::AccountingPhoneNumber]
      def retrieve(id:, include_remote_data: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/accounting/v1/phone-numbers/#{id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "include_remote_data": include_remote_data
            }.compact
          end
          Accounting::AccountingPhoneNumber.from_json(json_object: response.body)
        end
      end
    end
  end
end
