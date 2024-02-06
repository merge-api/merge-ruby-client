# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/paginated_accounting_period_list"
require_relative "../types/accounting_period"
require "async"

module Merge
  module Accounting
    class AccountingPeriodsClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Accounting::AccountingPeriodsClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `AccountingPeriod` objects.
      #
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [RequestOptions]
      # @return [Accounting::PaginatedAccountingPeriodList]
      def list(cursor: nil, include_deleted_data: nil, include_remote_data: nil, page_size: nil, request_options: nil)
        response = @request_client.conn.get("/api/accounting/v1/accounting-periods") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "cursor": cursor,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "page_size": page_size
          }.compact
        end
        Accounting::PaginatedAccountingPeriodList.from_json(json_object: response.body)
      end

      # Returns an `AccountingPeriod` object with the given `id`.
      #
      # @param id [String]
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Accounting::AccountingPeriod]
      def retrieve(id:, include_remote_data: nil, request_options: nil)
        response = @request_client.conn.get("/api/accounting/v1/accounting-periods/#{id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "include_remote_data": include_remote_data
          }.compact
        end
        Accounting::AccountingPeriod.from_json(json_object: response.body)
      end
    end

    class AsyncAccountingPeriodsClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Accounting::AsyncAccountingPeriodsClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `AccountingPeriod` objects.
      #
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [RequestOptions]
      # @return [Accounting::PaginatedAccountingPeriodList]
      def list(cursor: nil, include_deleted_data: nil, include_remote_data: nil, page_size: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/accounting/v1/accounting-periods") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "cursor": cursor,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "page_size": page_size
            }.compact
          end
          Accounting::PaginatedAccountingPeriodList.from_json(json_object: response.body)
        end
      end

      # Returns an `AccountingPeriod` object with the given `id`.
      #
      # @param id [String]
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Accounting::AccountingPeriod]
      def retrieve(id:, include_remote_data: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/accounting/v1/accounting-periods/#{id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "include_remote_data": include_remote_data
            }.compact
          end
          Accounting::AccountingPeriod.from_json(json_object: response.body)
        end
      end
    end
  end
end
