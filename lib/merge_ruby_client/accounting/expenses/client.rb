# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/expenses_list_request_expand"
require_relative "../types/paginated_expense_list"
require_relative "../types/expense_request"
require_relative "../types/expense_response"
require_relative "types/expenses_retrieve_request_expand"
require_relative "../types/expense"
require_relative "../types/meta_response"
require "async"

module Merge
  module Accounting
    class ExpensesClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Accounting::ExpensesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Expense` objects.
      #
      # @param company_id [String] If provided, will only return expenses for this company.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Accounting::Expenses::ExpensesListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param transaction_date_after [DateTime] If provided, will only return objects created after this datetime.
      # @param transaction_date_before [DateTime] If provided, will only return objects created before this datetime.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedExpenseList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.list
      def list(company_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, transaction_date_after: nil, transaction_date_before: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "company_id": company_id,
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/expenses"
        end
        Merge::Accounting::PaginatedExpenseList.from_json(json_object: response.body)
      end

      # Creates an `Expense` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::ExpenseRequest, as a Hash
      #   * :transaction_date (DateTime)
      #   * :account (Hash)
      #   * :contact (Hash)
      #   * :total_amount (Float)
      #   * :sub_total (Float)
      #   * :total_tax_amount (Float)
      #   * :currency (Merge::Accounting::CurrencyEnum)
      #   * :exchange_rate (String)
      #   * :company (Hash)
      #   * :memo (String)
      #   * :lines (Array<Merge::Accounting::ExpenseLineRequest>)
      #   * :tracking_categories (Array<Merge::Accounting::ExpenseRequestTrackingCategoriesItem>)
      #   * :accounting_period (Hash)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::ExpenseResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.create(model: {  })
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.post do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/expenses"
        end
        Merge::Accounting::ExpenseResponse.from_json(json_object: response.body)
      end

      # Returns an `Expense` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Accounting::Expenses::ExpensesRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::Expense]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "expand": expand,
            "include_remote_data": include_remote_data
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/expenses/#{id}"
        end
        Merge::Accounting::Expense.from_json(json_object: response.body)
      end

      # Returns metadata for `Expense` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.meta_post_retrieve
      def meta_post_retrieve(request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/expenses/meta/post"
        end
        Merge::Accounting::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncExpensesClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Accounting::AsyncExpensesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Expense` objects.
      #
      # @param company_id [String] If provided, will only return expenses for this company.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Accounting::Expenses::ExpensesListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param transaction_date_after [DateTime] If provided, will only return objects created after this datetime.
      # @param transaction_date_before [DateTime] If provided, will only return objects created before this datetime.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedExpenseList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.list
      def list(company_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, transaction_date_after: nil, transaction_date_before: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "company_id": company_id,
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/expenses"
          end
          Merge::Accounting::PaginatedExpenseList.from_json(json_object: response.body)
        end
      end

      # Creates an `Expense` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::ExpenseRequest, as a Hash
      #   * :transaction_date (DateTime)
      #   * :account (Hash)
      #   * :contact (Hash)
      #   * :total_amount (Float)
      #   * :sub_total (Float)
      #   * :total_tax_amount (Float)
      #   * :currency (Merge::Accounting::CurrencyEnum)
      #   * :exchange_rate (String)
      #   * :company (Hash)
      #   * :memo (String)
      #   * :lines (Array<Merge::Accounting::ExpenseLineRequest>)
      #   * :tracking_categories (Array<Merge::Accounting::ExpenseRequestTrackingCategoriesItem>)
      #   * :accounting_period (Hash)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::ExpenseResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.create(model: {  })
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/expenses"
          end
          Merge::Accounting::ExpenseResponse.from_json(json_object: response.body)
        end
      end

      # Returns an `Expense` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Accounting::Expenses::ExpensesRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::Expense]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "expand": expand,
              "include_remote_data": include_remote_data
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/expenses/#{id}"
          end
          Merge::Accounting::Expense.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Expense` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.meta_post_retrieve
      def meta_post_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/expenses/meta/post"
          end
          Merge::Accounting::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
