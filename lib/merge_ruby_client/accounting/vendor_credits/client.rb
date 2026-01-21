# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/list_vendor_credits_request_expand"
require_relative "../types/paginated_vendor_credit_list"
require_relative "../types/vendor_credit_request"
require_relative "../types/vendor_credit_response"
require_relative "types/retrieve_vendor_credits_request_expand"
require_relative "../types/vendor_credit"
require_relative "../types/patched_vendor_credit_request"
require_relative "../types/meta_response"
require "async"

module Merge
  module Accounting
    class VendorCreditsClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Accounting::VendorCreditsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `VendorCredit` objects.{/*
      #  BEGIN_ACCOUNTING_VENDORCREDIT_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  9v/1+v8TXPkn7zEu54ou5kdn9Dq3cyMnCn4iX+Jf6AZ8YrZX3br/8FP3/V/9puNdf31b2ONIMnQEAAA"
      #  /></Footer>{/* END_ACCOUNTING_VENDORCREDIT_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param company_id [String] If provided, will only return vendor credits for this company.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Accounting::VendorCredits::ListVendorCreditsRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param transaction_date_after [DateTime] If provided, will only return objects created after this datetime.
      # @param transaction_date_before [DateTime] If provided, will only return objects created before this datetime.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedVendorCreditList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.vendor_credits.list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def list(company_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, include_shell_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, transaction_date_after: nil, transaction_date_before: nil, request_options: nil)
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
            "include_shell_data": include_shell_data,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "page_size": page_size,
            "remote_id": remote_id,
            "transaction_date_after": transaction_date_after,
            "transaction_date_before": transaction_date_before
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/vendor-credits"
        end
        Merge::Accounting::PaginatedVendorCreditList.from_json(json_object: response.body)
      end

      # Creates a `VendorCredit` object with the given values.{/*
      #  BEGIN_ACCOUNTING_VENDORCREDIT_CREATE_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="POST"
      #  y56qRL7Wf7bTE2lvFxeh+uAV8JtPfCXSc0e1nv0pE07ve7Lef+3+/5GdD+0dU/8tx//ABbvFUg1CgAA"
      #  /></Footer>{/* END_ACCOUNTING_VENDORCREDIT_CREATE_SUPPORTED_FIELDS * /}
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::VendorCreditRequest, as a Hash
      #   * :number (String)
      #   * :transaction_date (DateTime)
      #   * :vendor (String)
      #   * :total_amount (Float)
      #   * :currency (Merge::Accounting::TransactionCurrencyEnum)
      #   * :exchange_rate (String)
      #   * :inclusive_of_tax (Boolean)
      #   * :company (String)
      #   * :tracking_categories (Array<String>)
      #   * :applied_to_lines (Array<Merge::Accounting::VendorCreditApplyLineForVendorCreditRequest>)
      #   * :accounting_period (String)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::VendorCreditResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.vendor_credits.create(model: {  })
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/vendor-credits"
        end
        Merge::Accounting::VendorCreditResponse.from_json(json_object: response.body)
      end

      # Returns a `VendorCredit` object with the given `id`.{/*
      #  BEGIN_ACCOUNTING_VENDORCREDIT_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  9v/1+v8TXPkn7zEu54ou5kdn9Dq3cyMnCn4iX+Jf6AZ8YrZX3br/8FP3/V/9puNdf31b2ONIMnQEAAA"
      #  /></Footer>{/* END_ACCOUNTING_VENDORCREDIT_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param id [String]
      # @param expand [Merge::Accounting::VendorCredits::RetrieveVendorCreditsRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::VendorCredit]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.vendor_credits.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, include_shell_data: nil, request_options: nil)
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
            "include_shell_data": include_shell_data
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/vendor-credits/#{id}"
        end
        Merge::Accounting::VendorCredit.from_json(json_object: response.body)
      end

      # Updates a `VendorCredit` object with the given `id`.{/*
      #  BEGIN_ACCOUNTING_VENDORCREDIT_EDIT_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="EDIT"
      #  YV7MUEBD+7HoJvhoZXOjsUbbbtGrT6mUw7J/7RleKc3XDJRGj5HqsbUwvI/bMDd0w/5COivvAYAAA=="
      #  /></Footer>{/* END_ACCOUNTING_VENDORCREDIT_EDIT_SUPPORTED_FIELDS * /}
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::PatchedVendorCreditRequest, as a Hash
      #   * :number (String)
      #   * :transaction_date (DateTime)
      #   * :vendor (String)
      #   * :currency (Merge::Accounting::TransactionCurrencyEnum)
      #   * :exchange_rate (String)
      #   * :inclusive_of_tax (Boolean)
      #   * :company (String)
      #   * :tracking_categories (Array<String>)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::VendorCreditResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.vendor_credits.partial_update(id: "id", model: {  })
      def partial_update(id:, model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.patch do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/vendor-credits/#{id}"
        end
        Merge::Accounting::VendorCreditResponse.from_json(json_object: response.body)
      end

      # Creates a new VendorCreditApplyLine to apply a vendor credit to an invoice{/*
      #  BEGIN_ACCOUNTING_VENDORCREDIT_CREATE_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="POST"
      #  y56qRL7Wf7bTE2lvFxeh+uAV8JtPfCXSc0e1nv0pE07ve7Lef+3+/5GdD+0dU/8tx//ABbvFUg1CgAA"
      #  /></Footer>{/* END_ACCOUNTING_VENDORCREDIT_CREATE_SUPPORTED_FIELDS * /}
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param invoice [String] The invoice to apply the vendor credit to.
      # @param applied_date [DateTime] Date that the vendor credit is applied to the invoice.
      # @param applied_amount [String] The amount of vendor credit applied to the invoice.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::VendorCreditResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.vendor_credits.application_create(
      #    id: "id",
      #    applied_date: DateTime.parse("2024-01-15T09:30:00.000Z"),
      #    applied_amount: "applied_amount"
      #  )
      def application_create(id:, applied_date:, applied_amount:, is_debug_mode: nil, run_async: nil, invoice: nil,
                             request_options: nil)
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
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            invoice: invoice,
            applied_date: applied_date,
            applied_amount: applied_amount
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/vendor-credits/#{id}/application"
        end
        Merge::Accounting::VendorCreditResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `VendorCredit` PATCHs.{/*
      #  BEGIN_ACCOUNTING_VENDORCREDIT_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  9v/1+v8TXPkn7zEu54ou5kdn9Dq3cyMnCn4iX+Jf6AZ8YrZX3br/8FP3/V/9puNdf31b2ONIMnQEAAA"
      #  /></Footer>{/* END_ACCOUNTING_VENDORCREDIT_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.vendor_credits.meta_patch_retrieve(id: "id")
      def meta_patch_retrieve(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/vendor-credits/meta/patch/#{id}"
        end
        Merge::Accounting::MetaResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `VendorCredit` POSTs.{/*
      #  BEGIN_ACCOUNTING_VENDORCREDIT_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  9v/1+v8TXPkn7zEu54ou5kdn9Dq3cyMnCn4iX+Jf6AZ8YrZX3br/8FP3/V/9puNdf31b2ONIMnQEAAA"
      #  /></Footer>{/* END_ACCOUNTING_VENDORCREDIT_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.vendor_credits.meta_post_retrieve
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/vendor-credits/meta/post"
        end
        Merge::Accounting::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncVendorCreditsClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Accounting::AsyncVendorCreditsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `VendorCredit` objects.{/*
      #  BEGIN_ACCOUNTING_VENDORCREDIT_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  9v/1+v8TXPkn7zEu54ou5kdn9Dq3cyMnCn4iX+Jf6AZ8YrZX3br/8FP3/V/9puNdf31b2ONIMnQEAAA"
      #  /></Footer>{/* END_ACCOUNTING_VENDORCREDIT_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param company_id [String] If provided, will only return vendor credits for this company.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Accounting::VendorCredits::ListVendorCreditsRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param transaction_date_after [DateTime] If provided, will only return objects created after this datetime.
      # @param transaction_date_before [DateTime] If provided, will only return objects created before this datetime.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedVendorCreditList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.vendor_credits.list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def list(company_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, include_shell_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, transaction_date_after: nil, transaction_date_before: nil, request_options: nil)
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
              "include_shell_data": include_shell_data,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "page_size": page_size,
              "remote_id": remote_id,
              "transaction_date_after": transaction_date_after,
              "transaction_date_before": transaction_date_before
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/vendor-credits"
          end
          Merge::Accounting::PaginatedVendorCreditList.from_json(json_object: response.body)
        end
      end

      # Creates a `VendorCredit` object with the given values.{/*
      #  BEGIN_ACCOUNTING_VENDORCREDIT_CREATE_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="POST"
      #  y56qRL7Wf7bTE2lvFxeh+uAV8JtPfCXSc0e1nv0pE07ve7Lef+3+/5GdD+0dU/8tx//ABbvFUg1CgAA"
      #  /></Footer>{/* END_ACCOUNTING_VENDORCREDIT_CREATE_SUPPORTED_FIELDS * /}
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::VendorCreditRequest, as a Hash
      #   * :number (String)
      #   * :transaction_date (DateTime)
      #   * :vendor (String)
      #   * :total_amount (Float)
      #   * :currency (Merge::Accounting::TransactionCurrencyEnum)
      #   * :exchange_rate (String)
      #   * :inclusive_of_tax (Boolean)
      #   * :company (String)
      #   * :tracking_categories (Array<String>)
      #   * :applied_to_lines (Array<Merge::Accounting::VendorCreditApplyLineForVendorCreditRequest>)
      #   * :accounting_period (String)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::VendorCreditResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.vendor_credits.create(model: {  })
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/vendor-credits"
          end
          Merge::Accounting::VendorCreditResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `VendorCredit` object with the given `id`.{/*
      #  BEGIN_ACCOUNTING_VENDORCREDIT_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  9v/1+v8TXPkn7zEu54ou5kdn9Dq3cyMnCn4iX+Jf6AZ8YrZX3br/8FP3/V/9puNdf31b2ONIMnQEAAA"
      #  /></Footer>{/* END_ACCOUNTING_VENDORCREDIT_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param id [String]
      # @param expand [Merge::Accounting::VendorCredits::RetrieveVendorCreditsRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::VendorCredit]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.vendor_credits.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, include_shell_data: nil, request_options: nil)
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
              "include_shell_data": include_shell_data
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/vendor-credits/#{id}"
          end
          Merge::Accounting::VendorCredit.from_json(json_object: response.body)
        end
      end

      # Updates a `VendorCredit` object with the given `id`.{/*
      #  BEGIN_ACCOUNTING_VENDORCREDIT_EDIT_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="EDIT"
      #  YV7MUEBD+7HoJvhoZXOjsUbbbtGrT6mUw7J/7RleKc3XDJRGj5HqsbUwvI/bMDd0w/5COivvAYAAA=="
      #  /></Footer>{/* END_ACCOUNTING_VENDORCREDIT_EDIT_SUPPORTED_FIELDS * /}
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::PatchedVendorCreditRequest, as a Hash
      #   * :number (String)
      #   * :transaction_date (DateTime)
      #   * :vendor (String)
      #   * :currency (Merge::Accounting::TransactionCurrencyEnum)
      #   * :exchange_rate (String)
      #   * :inclusive_of_tax (Boolean)
      #   * :company (String)
      #   * :tracking_categories (Array<String>)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::VendorCreditResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.vendor_credits.partial_update(id: "id", model: {  })
      def partial_update(id:, model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.patch do |req|
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/vendor-credits/#{id}"
          end
          Merge::Accounting::VendorCreditResponse.from_json(json_object: response.body)
        end
      end

      # Creates a new VendorCreditApplyLine to apply a vendor credit to an invoice{/*
      #  BEGIN_ACCOUNTING_VENDORCREDIT_CREATE_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="POST"
      #  y56qRL7Wf7bTE2lvFxeh+uAV8JtPfCXSc0e1nv0pE07ve7Lef+3+/5GdD+0dU/8tx//ABbvFUg1CgAA"
      #  /></Footer>{/* END_ACCOUNTING_VENDORCREDIT_CREATE_SUPPORTED_FIELDS * /}
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param invoice [String] The invoice to apply the vendor credit to.
      # @param applied_date [DateTime] Date that the vendor credit is applied to the invoice.
      # @param applied_amount [String] The amount of vendor credit applied to the invoice.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::VendorCreditResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.vendor_credits.application_create(
      #    id: "id",
      #    applied_date: DateTime.parse("2024-01-15T09:30:00.000Z"),
      #    applied_amount: "applied_amount"
      #  )
      def application_create(id:, applied_date:, applied_amount:, is_debug_mode: nil, run_async: nil, invoice: nil,
                             request_options: nil)
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
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              invoice: invoice,
              applied_date: applied_date,
              applied_amount: applied_amount
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/vendor-credits/#{id}/application"
          end
          Merge::Accounting::VendorCreditResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `VendorCredit` PATCHs.{/*
      #  BEGIN_ACCOUNTING_VENDORCREDIT_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  9v/1+v8TXPkn7zEu54ou5kdn9Dq3cyMnCn4iX+Jf6AZ8YrZX3br/8FP3/V/9puNdf31b2ONIMnQEAAA"
      #  /></Footer>{/* END_ACCOUNTING_VENDORCREDIT_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.vendor_credits.meta_patch_retrieve(id: "id")
      def meta_patch_retrieve(id:, request_options: nil)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/vendor-credits/meta/patch/#{id}"
          end
          Merge::Accounting::MetaResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `VendorCredit` POSTs.{/*
      #  BEGIN_ACCOUNTING_VENDORCREDIT_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  9v/1+v8TXPkn7zEu54ou5kdn9Dq3cyMnCn4iX+Jf6AZ8YrZX3br/8FP3/V/9puNdf31b2ONIMnQEAAA"
      #  /></Footer>{/* END_ACCOUNTING_VENDORCREDIT_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.vendor_credits.meta_post_retrieve
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/vendor-credits/meta/post"
          end
          Merge::Accounting::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
