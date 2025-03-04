# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/credit_notes_list_request_expand"
require_relative "types/credit_notes_list_request_remote_fields"
require_relative "types/credit_notes_list_request_show_enum_origins"
require_relative "../types/paginated_credit_note_list"
require_relative "../types/credit_note_request"
require_relative "../types/credit_note_response"
require_relative "types/credit_notes_retrieve_request_expand"
require_relative "types/credit_notes_retrieve_request_remote_fields"
require_relative "types/credit_notes_retrieve_request_show_enum_origins"
require_relative "../types/credit_note"
require_relative "../types/meta_response"
require "async"

module Merge
  module Accounting
    class CreditNotesClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Accounting::CreditNotesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `CreditNote` objects.
      #
      # @param company_id [String] If provided, will only return credit notes for this company.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Accounting::CreditNotes::CreditNotesListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
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
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [Merge::Accounting::CreditNotes::CreditNotesListRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [Merge::Accounting::CreditNotes::CreditNotesListRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param transaction_date_after [DateTime] If provided, will only return objects created after this datetime.
      # @param transaction_date_before [DateTime] If provided, will only return objects created before this datetime.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedCreditNoteList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.credit_notes.list
      def list(company_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, include_shell_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, transaction_date_after: nil, transaction_date_before: nil, request_options: nil)
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
            "remote_fields": remote_fields,
            "remote_id": remote_id,
            "show_enum_origins": show_enum_origins,
            "transaction_date_after": transaction_date_after,
            "transaction_date_before": transaction_date_before
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/credit-notes"
        end
        Merge::Accounting::PaginatedCreditNoteList.from_json(json_object: response.body)
      end

      # Creates a `CreditNote` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::CreditNoteRequest, as a Hash
      #   * :transaction_date (DateTime)
      #   * :status (Merge::Accounting::CreditNoteStatusEnum)
      #   * :number (String)
      #   * :contact (Hash)
      #   * :company (Hash)
      #   * :exchange_rate (String)
      #   * :total_amount (Float)
      #   * :remaining_credit (Float)
      #   * :inclusive_of_tax (Boolean)
      #   * :line_items (Array<Merge::Accounting::CreditNoteRequestLineItemsItem>)
      #   * :tracking_categories (Array<Merge::Accounting::CreditNoteRequestTrackingCategoriesItem>)
      #   * :currency (Merge::Accounting::TransactionCurrencyEnum)
      #   * :payments (Array<Merge::Accounting::CreditNoteRequestPaymentsItem>)
      #   * :applied_payments (Array<Merge::Accounting::CreditNoteRequestAppliedPaymentsItem>)
      #   * :accounting_period (Hash)
      #   * :applied_to_lines (Array<Merge::Accounting::CreditNoteApplyLineForCreditNoteRequest>)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::CreditNoteResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.credit_notes.create(model: {  })
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/credit-notes"
        end
        Merge::Accounting::CreditNoteResponse.from_json(json_object: response.body)
      end

      # Returns a `CreditNote` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Accounting::CreditNotes::CreditNotesRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param remote_fields [Merge::Accounting::CreditNotes::CreditNotesRetrieveRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [Merge::Accounting::CreditNotes::CreditNotesRetrieveRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::CreditNote]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.credit_notes.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, include_shell_data: nil, remote_fields: nil,
                   show_enum_origins: nil, request_options: nil)
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
            "include_shell_data": include_shell_data,
            "remote_fields": remote_fields,
            "show_enum_origins": show_enum_origins
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/credit-notes/#{id}"
        end
        Merge::Accounting::CreditNote.from_json(json_object: response.body)
      end

      # Returns metadata for `CreditNote` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.credit_notes.meta_post_retrieve
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/credit-notes/meta/post"
        end
        Merge::Accounting::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncCreditNotesClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Accounting::AsyncCreditNotesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `CreditNote` objects.
      #
      # @param company_id [String] If provided, will only return credit notes for this company.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Accounting::CreditNotes::CreditNotesListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
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
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [Merge::Accounting::CreditNotes::CreditNotesListRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [Merge::Accounting::CreditNotes::CreditNotesListRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param transaction_date_after [DateTime] If provided, will only return objects created after this datetime.
      # @param transaction_date_before [DateTime] If provided, will only return objects created before this datetime.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedCreditNoteList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.credit_notes.list
      def list(company_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, include_shell_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, transaction_date_after: nil, transaction_date_before: nil, request_options: nil)
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
              "remote_fields": remote_fields,
              "remote_id": remote_id,
              "show_enum_origins": show_enum_origins,
              "transaction_date_after": transaction_date_after,
              "transaction_date_before": transaction_date_before
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/credit-notes"
          end
          Merge::Accounting::PaginatedCreditNoteList.from_json(json_object: response.body)
        end
      end

      # Creates a `CreditNote` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::CreditNoteRequest, as a Hash
      #   * :transaction_date (DateTime)
      #   * :status (Merge::Accounting::CreditNoteStatusEnum)
      #   * :number (String)
      #   * :contact (Hash)
      #   * :company (Hash)
      #   * :exchange_rate (String)
      #   * :total_amount (Float)
      #   * :remaining_credit (Float)
      #   * :inclusive_of_tax (Boolean)
      #   * :line_items (Array<Merge::Accounting::CreditNoteRequestLineItemsItem>)
      #   * :tracking_categories (Array<Merge::Accounting::CreditNoteRequestTrackingCategoriesItem>)
      #   * :currency (Merge::Accounting::TransactionCurrencyEnum)
      #   * :payments (Array<Merge::Accounting::CreditNoteRequestPaymentsItem>)
      #   * :applied_payments (Array<Merge::Accounting::CreditNoteRequestAppliedPaymentsItem>)
      #   * :accounting_period (Hash)
      #   * :applied_to_lines (Array<Merge::Accounting::CreditNoteApplyLineForCreditNoteRequest>)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::CreditNoteResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.credit_notes.create(model: {  })
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/credit-notes"
          end
          Merge::Accounting::CreditNoteResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `CreditNote` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Accounting::CreditNotes::CreditNotesRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param remote_fields [Merge::Accounting::CreditNotes::CreditNotesRetrieveRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [Merge::Accounting::CreditNotes::CreditNotesRetrieveRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::CreditNote]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.credit_notes.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, include_shell_data: nil, remote_fields: nil,
                   show_enum_origins: nil, request_options: nil)
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
              "include_shell_data": include_shell_data,
              "remote_fields": remote_fields,
              "show_enum_origins": show_enum_origins
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/credit-notes/#{id}"
          end
          Merge::Accounting::CreditNote.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `CreditNote` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.credit_notes.meta_post_retrieve
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/credit-notes/meta/post"
          end
          Merge::Accounting::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
