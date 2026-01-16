# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/list_sales_orders_request_expand"
require_relative "../types/paginated_sales_order_list"
require_relative "../types/sales_order_request"
require_relative "../types/sales_order_response"
require_relative "types/retrieve_sales_orders_request_expand"
require_relative "../types/sales_order"
require_relative "../types/paginated_remote_field_class_list"
require_relative "../types/meta_response"
require "async"

module Merge
  module Accounting
    class SalesOrdersClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Accounting::SalesOrdersClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `SalesOrder` objects.{/*
      #  BEGIN_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  0ijBAKKaUGWQKevB7FImOYNVvXE5MEEqL3LTaym6Nlt6rGMyqO8BA8VEvrkz9tft79+Azegx9bCBQAA"
      #  /></Footer>{/* END_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param company_id [String] If provided, will only return sales orders for this company.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Accounting::SalesOrders::ListSalesOrdersRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param issue_date_after [DateTime] If provided, will only return objects created after this datetime.
      # @param issue_date_before [DateTime] If provided, will only return objects created before this datetime.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [String] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedSalesOrderList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.sales_orders.list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def list(company_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, include_remote_fields: nil, include_shell_data: nil, issue_date_after: nil, issue_date_before: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "company_id": company_id,
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_remote_fields": include_remote_fields,
            "include_shell_data": include_shell_data,
            "issue_date_after": issue_date_after,
            "issue_date_before": issue_date_before,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "page_size": page_size,
            "remote_fields": remote_fields,
            "remote_id": remote_id,
            "show_enum_origins": show_enum_origins
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/sales-orders"
        end
        Merge::Accounting::PaginatedSalesOrderList.from_json(json_object: response.body)
      end

      # Creates a `SalesOrder` object with the given values.{/*
      #  BEGIN_ACCOUNTING_SALESORDER_CREATE_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="POST"
      #  +doyG2Z495zg+wcDEh0aOoJvDb7YkZNNfW6vvEyKsDavd6rM+IO5c75j+h/Qm6fb59/Ajdzb527BAAA"
      #  /></Footer>{/* END_ACCOUNTING_SALESORDER_CREATE_SUPPORTED_FIELDS * /}
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::SalesOrderRequest, as a Hash
      #   * :customer (String)
      #   * :currency (Merge::Accounting::TransactionCurrencyEnum)
      #   * :exchange_rate (String)
      #   * :company (String)
      #   * :status (Merge::Accounting::SalesOrderStatusEnum)
      #   * :payment_term (String)
      #   * :memo (String)
      #   * :shipping_address (String)
      #   * :tracking_categories (Array<String>)
      #   * :issue_date (DateTime)
      #   * :transaction_number (String)
      #   * :total (Float)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      #   * :remote_fields (Array<Merge::Accounting::RemoteFieldRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::SalesOrderResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.sales_orders.create(model: {  })
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "is_debug_mode": is_debug_mode,
            "run_async": run_async
          }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), model: model }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/sales-orders"
        end
        Merge::Accounting::SalesOrderResponse.from_json(json_object: response.body)
      end

      # Returns a `SalesOrder` object with the given `id`.{/*
      #  BEGIN_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  0ijBAKKaUGWQKevB7FImOYNVvXE5MEEqL3LTaym6Nlt6rGMyqO8BA8VEvrkz9tft79+Azegx9bCBQAA"
      #  /></Footer>{/* END_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param id [String]
      # @param expand [Merge::Accounting::SalesOrders::RetrieveSalesOrdersRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [String] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::SalesOrder]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.sales_orders.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, include_remote_fields: nil, include_shell_data: nil,
                   remote_fields: nil, show_enum_origins: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "expand": expand,
            "include_remote_data": include_remote_data,
            "include_remote_fields": include_remote_fields,
            "include_shell_data": include_shell_data,
            "remote_fields": remote_fields,
            "show_enum_origins": show_enum_origins
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/sales-orders/#{id}"
        end
        Merge::Accounting::SalesOrder.from_json(json_object: response.body)
      end

      # Returns a list of `RemoteFieldClass` objects.{/*
      #  BEGIN_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  0ijBAKKaUGWQKevB7FImOYNVvXE5MEEqL3LTaym6Nlt6rGMyqO8BA8VEvrkz9tft79+Azegx9bCBQAA"
      #  /></Footer>{/* END_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param is_common_model_field [Boolean] If provided, will only return remote field classes with this
      #  is_common_model_field value
      # @param is_custom [Boolean] If provided, will only return remote fields classes with this is_custom value
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedRemoteFieldClassList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.sales_orders.lines_remote_field_classes_list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def lines_remote_field_classes_list(cursor: nil, include_deleted_data: nil, include_remote_data: nil,
                                          include_shell_data: nil, is_common_model_field: nil, is_custom: nil, page_size: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "cursor": cursor,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_shell_data": include_shell_data,
            "is_common_model_field": is_common_model_field,
            "is_custom": is_custom,
            "page_size": page_size
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/sales-orders/lines/remote-field-classes"
        end
        Merge::Accounting::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
      end

      # Returns metadata for `SalesOrder` POSTs.{/*
      #  BEGIN_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  0ijBAKKaUGWQKevB7FImOYNVvXE5MEEqL3LTaym6Nlt6rGMyqO8BA8VEvrkz9tft79+Azegx9bCBQAA"
      #  /></Footer>{/* END_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.sales_orders.meta_post_retrieve
      def meta_post_retrieve(request_options: nil)
        response = @request_client.conn.get do |req|
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
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/sales-orders/meta/post"
        end
        Merge::Accounting::MetaResponse.from_json(json_object: response.body)
      end

      # Returns a list of `RemoteFieldClass` objects.{/*
      #  BEGIN_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  0ijBAKKaUGWQKevB7FImOYNVvXE5MEEqL3LTaym6Nlt6rGMyqO8BA8VEvrkz9tft79+Azegx9bCBQAA"
      #  /></Footer>{/* END_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param is_common_model_field [Boolean] If provided, will only return remote field classes with this
      #  is_common_model_field value
      # @param is_custom [Boolean] If provided, will only return remote fields classes with this is_custom value
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedRemoteFieldClassList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.sales_orders.remote_field_classes_list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def remote_field_classes_list(cursor: nil, include_deleted_data: nil, include_remote_data: nil,
                                    include_shell_data: nil, is_common_model_field: nil, is_custom: nil, page_size: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "cursor": cursor,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_shell_data": include_shell_data,
            "is_common_model_field": is_common_model_field,
            "is_custom": is_custom,
            "page_size": page_size
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/sales-orders/remote-field-classes"
        end
        Merge::Accounting::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
      end
    end

    class AsyncSalesOrdersClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Accounting::AsyncSalesOrdersClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `SalesOrder` objects.{/*
      #  BEGIN_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  0ijBAKKaUGWQKevB7FImOYNVvXE5MEEqL3LTaym6Nlt6rGMyqO8BA8VEvrkz9tft79+Azegx9bCBQAA"
      #  /></Footer>{/* END_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param company_id [String] If provided, will only return sales orders for this company.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Accounting::SalesOrders::ListSalesOrdersRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param issue_date_after [DateTime] If provided, will only return objects created after this datetime.
      # @param issue_date_before [DateTime] If provided, will only return objects created before this datetime.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [String] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedSalesOrderList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.sales_orders.list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def list(company_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, include_remote_fields: nil, include_shell_data: nil, issue_date_after: nil, issue_date_before: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "company_id": company_id,
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_remote_fields": include_remote_fields,
              "include_shell_data": include_shell_data,
              "issue_date_after": issue_date_after,
              "issue_date_before": issue_date_before,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "page_size": page_size,
              "remote_fields": remote_fields,
              "remote_id": remote_id,
              "show_enum_origins": show_enum_origins
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/sales-orders"
          end
          Merge::Accounting::PaginatedSalesOrderList.from_json(json_object: response.body)
        end
      end

      # Creates a `SalesOrder` object with the given values.{/*
      #  BEGIN_ACCOUNTING_SALESORDER_CREATE_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="POST"
      #  +doyG2Z495zg+wcDEh0aOoJvDb7YkZNNfW6vvEyKsDavd6rM+IO5c75j+h/Qm6fb59/Ajdzb527BAAA"
      #  /></Footer>{/* END_ACCOUNTING_SALESORDER_CREATE_SUPPORTED_FIELDS * /}
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::SalesOrderRequest, as a Hash
      #   * :customer (String)
      #   * :currency (Merge::Accounting::TransactionCurrencyEnum)
      #   * :exchange_rate (String)
      #   * :company (String)
      #   * :status (Merge::Accounting::SalesOrderStatusEnum)
      #   * :payment_term (String)
      #   * :memo (String)
      #   * :shipping_address (String)
      #   * :tracking_categories (Array<String>)
      #   * :issue_date (DateTime)
      #   * :transaction_number (String)
      #   * :total (Float)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      #   * :remote_fields (Array<Merge::Accounting::RemoteFieldRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::SalesOrderResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.sales_orders.create(model: {  })
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
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
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "is_debug_mode": is_debug_mode,
              "run_async": run_async
            }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), model: model }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/sales-orders"
          end
          Merge::Accounting::SalesOrderResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `SalesOrder` object with the given `id`.{/*
      #  BEGIN_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  0ijBAKKaUGWQKevB7FImOYNVvXE5MEEqL3LTaym6Nlt6rGMyqO8BA8VEvrkz9tft79+Azegx9bCBQAA"
      #  /></Footer>{/* END_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param id [String]
      # @param expand [Merge::Accounting::SalesOrders::RetrieveSalesOrdersRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [String] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::SalesOrder]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.sales_orders.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, include_remote_fields: nil, include_shell_data: nil,
                   remote_fields: nil, show_enum_origins: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "expand": expand,
              "include_remote_data": include_remote_data,
              "include_remote_fields": include_remote_fields,
              "include_shell_data": include_shell_data,
              "remote_fields": remote_fields,
              "show_enum_origins": show_enum_origins
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/sales-orders/#{id}"
          end
          Merge::Accounting::SalesOrder.from_json(json_object: response.body)
        end
      end

      # Returns a list of `RemoteFieldClass` objects.{/*
      #  BEGIN_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  0ijBAKKaUGWQKevB7FImOYNVvXE5MEEqL3LTaym6Nlt6rGMyqO8BA8VEvrkz9tft79+Azegx9bCBQAA"
      #  /></Footer>{/* END_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param is_common_model_field [Boolean] If provided, will only return remote field classes with this
      #  is_common_model_field value
      # @param is_custom [Boolean] If provided, will only return remote fields classes with this is_custom value
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedRemoteFieldClassList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.sales_orders.lines_remote_field_classes_list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def lines_remote_field_classes_list(cursor: nil, include_deleted_data: nil, include_remote_data: nil,
                                          include_shell_data: nil, is_common_model_field: nil, is_custom: nil, page_size: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "cursor": cursor,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_shell_data": include_shell_data,
              "is_common_model_field": is_common_model_field,
              "is_custom": is_custom,
              "page_size": page_size
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/sales-orders/lines/remote-field-classes"
          end
          Merge::Accounting::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `SalesOrder` POSTs.{/*
      #  BEGIN_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  0ijBAKKaUGWQKevB7FImOYNVvXE5MEEqL3LTaym6Nlt6rGMyqO8BA8VEvrkz9tft79+Azegx9bCBQAA"
      #  /></Footer>{/* END_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.sales_orders.meta_post_retrieve
      def meta_post_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
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
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/sales-orders/meta/post"
          end
          Merge::Accounting::MetaResponse.from_json(json_object: response.body)
        end
      end

      # Returns a list of `RemoteFieldClass` objects.{/*
      #  BEGIN_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  0ijBAKKaUGWQKevB7FImOYNVvXE5MEEqL3LTaym6Nlt6rGMyqO8BA8VEvrkz9tft79+Azegx9bCBQAA"
      #  /></Footer>{/* END_ACCOUNTING_SALESORDER_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param is_common_model_field [Boolean] If provided, will only return remote field classes with this
      #  is_common_model_field value
      # @param is_custom [Boolean] If provided, will only return remote fields classes with this is_custom value
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedRemoteFieldClassList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.sales_orders.remote_field_classes_list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def remote_field_classes_list(cursor: nil, include_deleted_data: nil, include_remote_data: nil,
                                    include_shell_data: nil, is_common_model_field: nil, is_custom: nil, page_size: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "cursor": cursor,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_shell_data": include_shell_data,
              "is_common_model_field": is_common_model_field,
              "is_custom": is_custom,
              "page_size": page_size
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/sales-orders/remote-field-classes"
          end
          Merge::Accounting::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
        end
      end
    end
  end
end
