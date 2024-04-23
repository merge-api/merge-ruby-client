# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/invoices_list_request_expand"
require_relative "types/invoices_list_request_type"
require_relative "../types/paginated_invoice_list"
require_relative "../types/invoice_request"
require_relative "../types/invoice_response"
require_relative "types/invoices_retrieve_request_expand"
require_relative "../types/invoice"
require_relative "../types/meta_response"
require "async"

module Merge
  module Accounting
    class InvoicesClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Accounting::InvoicesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Invoice` objects.
      #
      # @param company_id [String] If provided, will only return invoices for this company.
      # @param contact_id [String] If provided, will only return invoices for this contact.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Accounting::Invoices::InvoicesListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param issue_date_after [DateTime] If provided, will only return objects created after this datetime.
      # @param issue_date_before [DateTime] If provided, will only return objects created before this datetime.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [String] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param type [Merge::Accounting::Invoices::InvoicesListRequestType] If provided, will only return Invoices with this type
      #  - `ACCOUNTS_RECEIVABLE` - ACCOUNTS_RECEIVABLE
      #  - `ACCOUNTS_PAYABLE` - ACCOUNTS_PAYABLE
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedInvoiceList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.list
      def list(company_id: nil, contact_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, issue_date_after: nil, issue_date_before: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, type: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "company_id": company_id,
            "contact_id": contact_id,
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "issue_date_after": issue_date_after,
            "issue_date_before": issue_date_before,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "page_size": page_size,
            "remote_fields": remote_fields,
            "remote_id": remote_id,
            "show_enum_origins": show_enum_origins,
            "type": type
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/invoices"
        end
        Merge::Accounting::PaginatedInvoiceList.from_json(json_object: response.body)
      end

      # Creates an `Invoice` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::InvoiceRequest, as a Hash
      #   * :type (Merge::Accounting::InvoiceTypeEnum)
      #   * :contact (Hash)
      #   * :number (String)
      #   * :issue_date (DateTime)
      #   * :due_date (DateTime)
      #   * :paid_on_date (DateTime)
      #   * :memo (String)
      #   * :status (Merge::Accounting::InvoiceStatusEnum)
      #   * :company (Hash)
      #   * :currency (Merge::Accounting::CurrencyEnum)
      #   * :exchange_rate (String)
      #   * :total_discount (Float)
      #   * :sub_total (Float)
      #   * :total_tax_amount (Float)
      #   * :total_amount (Float)
      #   * :balance (Float)
      #   * :payments (Array<Merge::Accounting::InvoiceRequestPaymentsItem>)
      #   * :tracking_categories (Array<Merge::Accounting::InvoiceRequestTrackingCategoriesItem>)
      #   * :line_items (Array<Merge::Accounting::InvoiceLineItemRequest>)
      #   * :purchase_orders (Array<Merge::Accounting::InvoiceRequestPurchaseOrdersItem>)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::InvoiceResponse]
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/invoices"
        end
        Merge::Accounting::InvoiceResponse.from_json(json_object: response.body)
      end

      # Returns an `Invoice` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Accounting::Invoices::InvoicesRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [String] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::Invoice]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, remote_fields: nil, show_enum_origins: nil,
                   request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "expand": expand,
            "include_remote_data": include_remote_data,
            "remote_fields": remote_fields,
            "show_enum_origins": show_enum_origins
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/invoices/#{id}"
        end
        Merge::Accounting::Invoice.from_json(json_object: response.body)
      end

      # Updates an `Invoice` object with the given `id`.
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::InvoiceRequest, as a Hash
      #   * :type (Merge::Accounting::InvoiceTypeEnum)
      #   * :contact (Hash)
      #   * :number (String)
      #   * :issue_date (DateTime)
      #   * :due_date (DateTime)
      #   * :paid_on_date (DateTime)
      #   * :memo (String)
      #   * :status (Merge::Accounting::InvoiceStatusEnum)
      #   * :company (Hash)
      #   * :currency (Merge::Accounting::CurrencyEnum)
      #   * :exchange_rate (String)
      #   * :total_discount (Float)
      #   * :sub_total (Float)
      #   * :total_tax_amount (Float)
      #   * :total_amount (Float)
      #   * :balance (Float)
      #   * :payments (Array<Merge::Accounting::InvoiceRequestPaymentsItem>)
      #   * :tracking_categories (Array<Merge::Accounting::InvoiceRequestTrackingCategoriesItem>)
      #   * :line_items (Array<Merge::Accounting::InvoiceLineItemRequest>)
      #   * :purchase_orders (Array<Merge::Accounting::InvoiceRequestPurchaseOrdersItem>)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::InvoiceResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.partial_update(id: "id", model: {  })
      def partial_update(id:, model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.patch do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/invoices/#{id}"
        end
        Merge::Accounting::InvoiceResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `Invoice` PATCHs.
      #
      # @param id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.meta_patch_retrieve(id: "id")
      def meta_patch_retrieve(id:, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/invoices/meta/patch/#{id}"
        end
        Merge::Accounting::MetaResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `Invoice` POSTs.
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/invoices/meta/post"
        end
        Merge::Accounting::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncInvoicesClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Accounting::AsyncInvoicesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Invoice` objects.
      #
      # @param company_id [String] If provided, will only return invoices for this company.
      # @param contact_id [String] If provided, will only return invoices for this contact.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Accounting::Invoices::InvoicesListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param issue_date_after [DateTime] If provided, will only return objects created after this datetime.
      # @param issue_date_before [DateTime] If provided, will only return objects created before this datetime.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [String] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param type [Merge::Accounting::Invoices::InvoicesListRequestType] If provided, will only return Invoices with this type
      #  - `ACCOUNTS_RECEIVABLE` - ACCOUNTS_RECEIVABLE
      #  - `ACCOUNTS_PAYABLE` - ACCOUNTS_PAYABLE
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedInvoiceList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.list
      def list(company_id: nil, contact_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, issue_date_after: nil, issue_date_before: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, type: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "company_id": company_id,
              "contact_id": contact_id,
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "issue_date_after": issue_date_after,
              "issue_date_before": issue_date_before,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "page_size": page_size,
              "remote_fields": remote_fields,
              "remote_id": remote_id,
              "show_enum_origins": show_enum_origins,
              "type": type
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/invoices"
          end
          Merge::Accounting::PaginatedInvoiceList.from_json(json_object: response.body)
        end
      end

      # Creates an `Invoice` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::InvoiceRequest, as a Hash
      #   * :type (Merge::Accounting::InvoiceTypeEnum)
      #   * :contact (Hash)
      #   * :number (String)
      #   * :issue_date (DateTime)
      #   * :due_date (DateTime)
      #   * :paid_on_date (DateTime)
      #   * :memo (String)
      #   * :status (Merge::Accounting::InvoiceStatusEnum)
      #   * :company (Hash)
      #   * :currency (Merge::Accounting::CurrencyEnum)
      #   * :exchange_rate (String)
      #   * :total_discount (Float)
      #   * :sub_total (Float)
      #   * :total_tax_amount (Float)
      #   * :total_amount (Float)
      #   * :balance (Float)
      #   * :payments (Array<Merge::Accounting::InvoiceRequestPaymentsItem>)
      #   * :tracking_categories (Array<Merge::Accounting::InvoiceRequestTrackingCategoriesItem>)
      #   * :line_items (Array<Merge::Accounting::InvoiceLineItemRequest>)
      #   * :purchase_orders (Array<Merge::Accounting::InvoiceRequestPurchaseOrdersItem>)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::InvoiceResponse]
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/invoices"
          end
          Merge::Accounting::InvoiceResponse.from_json(json_object: response.body)
        end
      end

      # Returns an `Invoice` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Accounting::Invoices::InvoicesRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [String] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::Invoice]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, remote_fields: nil, show_enum_origins: nil,
                   request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "expand": expand,
              "include_remote_data": include_remote_data,
              "remote_fields": remote_fields,
              "show_enum_origins": show_enum_origins
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/invoices/#{id}"
          end
          Merge::Accounting::Invoice.from_json(json_object: response.body)
        end
      end

      # Updates an `Invoice` object with the given `id`.
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::InvoiceRequest, as a Hash
      #   * :type (Merge::Accounting::InvoiceTypeEnum)
      #   * :contact (Hash)
      #   * :number (String)
      #   * :issue_date (DateTime)
      #   * :due_date (DateTime)
      #   * :paid_on_date (DateTime)
      #   * :memo (String)
      #   * :status (Merge::Accounting::InvoiceStatusEnum)
      #   * :company (Hash)
      #   * :currency (Merge::Accounting::CurrencyEnum)
      #   * :exchange_rate (String)
      #   * :total_discount (Float)
      #   * :sub_total (Float)
      #   * :total_tax_amount (Float)
      #   * :total_amount (Float)
      #   * :balance (Float)
      #   * :payments (Array<Merge::Accounting::InvoiceRequestPaymentsItem>)
      #   * :tracking_categories (Array<Merge::Accounting::InvoiceRequestTrackingCategoriesItem>)
      #   * :line_items (Array<Merge::Accounting::InvoiceLineItemRequest>)
      #   * :purchase_orders (Array<Merge::Accounting::InvoiceRequestPurchaseOrdersItem>)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::InvoiceResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.partial_update(id: "id", model: {  })
      def partial_update(id:, model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.patch do |req|
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/invoices/#{id}"
          end
          Merge::Accounting::InvoiceResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Invoice` PATCHs.
      #
      # @param id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.meta_patch_retrieve(id: "id")
      def meta_patch_retrieve(id:, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/invoices/meta/patch/#{id}"
          end
          Merge::Accounting::MetaResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Invoice` POSTs.
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/invoices/meta/post"
          end
          Merge::Accounting::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
