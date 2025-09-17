# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/contacts_list_request_expand"
require_relative "../types/paginated_contact_list"
require_relative "../types/contact_request"
require_relative "../types/contact_response"
require_relative "types/contacts_retrieve_request_expand"
require_relative "../types/contact"
require_relative "../types/patched_contact_request"
require_relative "../types/meta_response"
require_relative "../types/paginated_remote_field_class_list"
require "async"

module Merge
  module Accounting
    class ContactsClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Accounting::ContactsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Contact` objects.
      #
      # @param company_id [String] If provided, will only return contacts for this company.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param email_address [String] If provided, will only return Contacts that match this email.
      # @param expand [Merge::Accounting::Contacts::ContactsListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
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
      # @param is_customer [String] If provided, will only return Contacts that are denoted as customers.
      # @param is_supplier [String] If provided, will only return Contacts that are denoted as suppliers.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param name [String] If provided, will only return Contacts that match this name.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [String] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param status [String] If provided, will only return Contacts that match this status.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedContactList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.contacts.list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def list(company_id: nil, created_after: nil, created_before: nil, cursor: nil, email_address: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, include_remote_fields: nil, include_shell_data: nil, is_customer: nil, is_supplier: nil, modified_after: nil, modified_before: nil, name: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, status: nil, request_options: nil)
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
            "email_address": email_address,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_remote_fields": include_remote_fields,
            "include_shell_data": include_shell_data,
            "is_customer": is_customer,
            "is_supplier": is_supplier,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "name": name,
            "page_size": page_size,
            "remote_fields": remote_fields,
            "remote_id": remote_id,
            "show_enum_origins": show_enum_origins,
            "status": status
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/contacts"
        end
        Merge::Accounting::PaginatedContactList.from_json(json_object: response.body)
      end

      # Creates a `Contact` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::ContactRequest, as a Hash
      #   * :name (String)
      #   * :is_supplier (Boolean)
      #   * :is_customer (Boolean)
      #   * :email_address (String)
      #   * :tax_number (String)
      #   * :status (Merge::Accounting::Status7D1Enum)
      #   * :currency (String)
      #   * :company (String)
      #   * :addresses (Array<Merge::Accounting::ContactRequestAddressesItem>)
      #   * :phone_numbers (Array<Merge::Accounting::AccountingPhoneNumberRequest>)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      #   * :remote_fields (Array<Merge::Accounting::RemoteFieldRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::ContactResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.contacts.create(model: {  })
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/contacts"
        end
        Merge::Accounting::ContactResponse.from_json(json_object: response.body)
      end

      # Returns a `Contact` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Accounting::Contacts::ContactsRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
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
      # @return [Merge::Accounting::Contact]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.contacts.retrieve(id: "id")
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/contacts/#{id}"
        end
        Merge::Accounting::Contact.from_json(json_object: response.body)
      end

      # Updates a `Contact` object with the given `id`.
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::PatchedContactRequest, as a Hash
      #   * :name (String)
      #   * :is_supplier (Boolean)
      #   * :is_customer (Boolean)
      #   * :email_address (String)
      #   * :tax_number (String)
      #   * :status (Merge::Accounting::Status7D1Enum)
      #   * :currency (String)
      #   * :company (String)
      #   * :addresses (Array<Merge::Accounting::PatchedContactRequestAddressesItem>)
      #   * :phone_numbers (Array<Merge::Accounting::AccountingPhoneNumberRequest>)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      #   * :remote_fields (Array<Merge::Accounting::RemoteFieldRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::ContactResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.contacts.partial_update(id: "id", model: {  })
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/contacts/#{id}"
        end
        Merge::Accounting::ContactResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `Contact` PATCHs.
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
      #  api.accounting.contacts.meta_patch_retrieve(id: "id")
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/contacts/meta/patch/#{id}"
        end
        Merge::Accounting::MetaResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `Contact` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.contacts.meta_post_retrieve
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/contacts/meta/post"
        end
        Merge::Accounting::MetaResponse.from_json(json_object: response.body)
      end

      # Returns a list of `RemoteFieldClass` objects.
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
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedRemoteFieldClassList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.contacts.remote_field_classes_list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/contacts/remote-field-classes"
        end
        Merge::Accounting::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
      end
    end

    class AsyncContactsClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Accounting::AsyncContactsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Contact` objects.
      #
      # @param company_id [String] If provided, will only return contacts for this company.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param email_address [String] If provided, will only return Contacts that match this email.
      # @param expand [Merge::Accounting::Contacts::ContactsListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
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
      # @param is_customer [String] If provided, will only return Contacts that are denoted as customers.
      # @param is_supplier [String] If provided, will only return Contacts that are denoted as suppliers.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param name [String] If provided, will only return Contacts that match this name.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [String] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param status [String] If provided, will only return Contacts that match this status.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedContactList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.contacts.list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def list(company_id: nil, created_after: nil, created_before: nil, cursor: nil, email_address: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, include_remote_fields: nil, include_shell_data: nil, is_customer: nil, is_supplier: nil, modified_after: nil, modified_before: nil, name: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, status: nil, request_options: nil)
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
              "email_address": email_address,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_remote_fields": include_remote_fields,
              "include_shell_data": include_shell_data,
              "is_customer": is_customer,
              "is_supplier": is_supplier,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "name": name,
              "page_size": page_size,
              "remote_fields": remote_fields,
              "remote_id": remote_id,
              "show_enum_origins": show_enum_origins,
              "status": status
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/contacts"
          end
          Merge::Accounting::PaginatedContactList.from_json(json_object: response.body)
        end
      end

      # Creates a `Contact` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::ContactRequest, as a Hash
      #   * :name (String)
      #   * :is_supplier (Boolean)
      #   * :is_customer (Boolean)
      #   * :email_address (String)
      #   * :tax_number (String)
      #   * :status (Merge::Accounting::Status7D1Enum)
      #   * :currency (String)
      #   * :company (String)
      #   * :addresses (Array<Merge::Accounting::ContactRequestAddressesItem>)
      #   * :phone_numbers (Array<Merge::Accounting::AccountingPhoneNumberRequest>)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      #   * :remote_fields (Array<Merge::Accounting::RemoteFieldRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::ContactResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.contacts.create(model: {  })
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/contacts"
          end
          Merge::Accounting::ContactResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `Contact` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Accounting::Contacts::ContactsRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
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
      # @return [Merge::Accounting::Contact]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.contacts.retrieve(id: "id")
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/contacts/#{id}"
          end
          Merge::Accounting::Contact.from_json(json_object: response.body)
        end
      end

      # Updates a `Contact` object with the given `id`.
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Accounting::PatchedContactRequest, as a Hash
      #   * :name (String)
      #   * :is_supplier (Boolean)
      #   * :is_customer (Boolean)
      #   * :email_address (String)
      #   * :tax_number (String)
      #   * :status (Merge::Accounting::Status7D1Enum)
      #   * :currency (String)
      #   * :company (String)
      #   * :addresses (Array<Merge::Accounting::PatchedContactRequestAddressesItem>)
      #   * :phone_numbers (Array<Merge::Accounting::AccountingPhoneNumberRequest>)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      #   * :remote_fields (Array<Merge::Accounting::RemoteFieldRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::ContactResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.contacts.partial_update(id: "id", model: {  })
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/contacts/#{id}"
          end
          Merge::Accounting::ContactResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Contact` PATCHs.
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
      #  api.accounting.contacts.meta_patch_retrieve(id: "id")
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/contacts/meta/patch/#{id}"
          end
          Merge::Accounting::MetaResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Contact` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.contacts.meta_post_retrieve
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/contacts/meta/post"
          end
          Merge::Accounting::MetaResponse.from_json(json_object: response.body)
        end
      end

      # Returns a list of `RemoteFieldClass` objects.
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
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedRemoteFieldClassList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.contacts.remote_field_classes_list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/contacts/remote-field-classes"
          end
          Merge::Accounting::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
        end
      end
    end
  end
end
