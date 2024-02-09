# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/payments_list_request_expand"
require_relative "../types/paginated_payment_list"
require_relative "../types/payment_request"
require_relative "../types/payment_response"
require_relative "types/payments_retrieve_request_expand"
require_relative "../types/payment"
require_relative "../types/meta_response"
require "async"

module Merge
  module Accounting
    class PaymentsClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Accounting::PaymentsClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `Payment` objects.
      #
      # @param account_id [String] If provided, will only return payments for this account.
      # @param company_id [String] If provided, will only return payments for this company.
      # @param contact_id [String] If provided, will only return payments for this contact.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [PAYMENTS_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param transaction_date_after [DateTime] If provided, will only return objects created after this datetime.
      # @param transaction_date_before [DateTime] If provided, will only return objects created before this datetime.
      # @param request_options [RequestOptions]
      # @return [Accounting::PaginatedPaymentList]
      def list(account_id: nil, company_id: nil, contact_id: nil, created_after: nil, created_before: nil, cursor: nil,
               expand: nil, include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, transaction_date_after: nil, transaction_date_before: nil, request_options: nil)
        response = @request_client.conn.get("/api/accounting/v1/payments") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "account_id": account_id,
            "company_id": company_id,
            "contact_id": contact_id,
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "page_size": page_size,
            "remote_id": remote_id,
            "transaction_date_after": transaction_date_after,
            "transaction_date_before": transaction_date_before
          }.compact
        end
        Accounting::PaginatedPaymentList.from_json(json_object: response.body)
      end

      # Creates a `Payment` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Accounting::PaymentRequest, as a Hash
      #   * :transaction_date (DateTime)
      #   * :contact (Hash)
      #   * :account (Hash)
      #   * :currency (CURRENCY_ENUM)
      #   * :exchange_rate (String)
      #   * :company (Hash)
      #   * :total_amount (Float)
      #   * :tracking_categories (Array<Accounting::PaymentRequestTrackingCategoriesItem>)
      #   * :accounting_period (Hash)
      #   * :applied_to_lines (Array<Accounting::PaymentRequestAppliedToLinesItem>)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param request_options [RequestOptions]
      # @return [Accounting::PaymentResponse]
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.post("/api/accounting/v1/payments") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "is_debug_mode": is_debug_mode,
            "run_async": run_async
          }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), model: model }.compact
        end
        Accounting::PaymentResponse.from_json(json_object: response.body)
      end

      # Returns a `Payment` object with the given `id`.
      #
      # @param id [String]
      # @param expand [PAYMENTS_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Accounting::Payment]
      def retrieve(id:, expand: nil, include_remote_data: nil, request_options: nil)
        response = @request_client.conn.get("/api/accounting/v1/payments/#{id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "expand": expand,
            "include_remote_data": include_remote_data
          }.compact
        end
        Accounting::Payment.from_json(json_object: response.body)
      end

      # Returns metadata for `Payment` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Accounting::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        response = @request_client.conn.get("/api/accounting/v1/payments/meta/post") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Accounting::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncPaymentsClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Accounting::AsyncPaymentsClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `Payment` objects.
      #
      # @param account_id [String] If provided, will only return payments for this account.
      # @param company_id [String] If provided, will only return payments for this company.
      # @param contact_id [String] If provided, will only return payments for this contact.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [PAYMENTS_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param transaction_date_after [DateTime] If provided, will only return objects created after this datetime.
      # @param transaction_date_before [DateTime] If provided, will only return objects created before this datetime.
      # @param request_options [RequestOptions]
      # @return [Accounting::PaginatedPaymentList]
      def list(account_id: nil, company_id: nil, contact_id: nil, created_after: nil, created_before: nil, cursor: nil,
               expand: nil, include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, transaction_date_after: nil, transaction_date_before: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/accounting/v1/payments") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "account_id": account_id,
              "company_id": company_id,
              "contact_id": contact_id,
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "page_size": page_size,
              "remote_id": remote_id,
              "transaction_date_after": transaction_date_after,
              "transaction_date_before": transaction_date_before
            }.compact
          end
          Accounting::PaginatedPaymentList.from_json(json_object: response.body)
        end
      end

      # Creates a `Payment` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Accounting::PaymentRequest, as a Hash
      #   * :transaction_date (DateTime)
      #   * :contact (Hash)
      #   * :account (Hash)
      #   * :currency (CURRENCY_ENUM)
      #   * :exchange_rate (String)
      #   * :company (Hash)
      #   * :total_amount (Float)
      #   * :tracking_categories (Array<Accounting::PaymentRequestTrackingCategoriesItem>)
      #   * :accounting_period (Hash)
      #   * :applied_to_lines (Array<Accounting::PaymentRequestAppliedToLinesItem>)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param request_options [RequestOptions]
      # @return [Accounting::PaymentResponse]
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/accounting/v1/payments") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "is_debug_mode": is_debug_mode,
              "run_async": run_async
            }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), model: model }.compact
          end
          Accounting::PaymentResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `Payment` object with the given `id`.
      #
      # @param id [String]
      # @param expand [PAYMENTS_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Accounting::Payment]
      def retrieve(id:, expand: nil, include_remote_data: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/accounting/v1/payments/#{id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "expand": expand,
              "include_remote_data": include_remote_data
            }.compact
          end
          Accounting::Payment.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Payment` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Accounting::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get("/api/accounting/v1/payments/meta/post") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Accounting::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
