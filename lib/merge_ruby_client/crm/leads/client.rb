# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/leads_list_request_expand"
require_relative "../types/paginated_lead_list"
require_relative "../types/lead_request"
require_relative "../types/lead_response"
require_relative "types/leads_retrieve_request_expand"
require_relative "../types/lead"
require_relative "../types/meta_response"
require_relative "../types/paginated_remote_field_class_list"
require "async"

module Merge
  module Crm
    class LeadsClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Crm::LeadsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Lead` objects.
      #
      # @param converted_account_id [String] If provided, will only return leads with this account.
      # @param converted_contact_id [String] If provided, will only return leads with this contact.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param email_addresses [String] If provided, will only return contacts matching the email addresses; multiple
      #  email_addresses can be separated by commas.
      # @param expand [Merge::Crm::Leads::LeadsListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
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
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param owner_id [String] If provided, will only return leads with this owner.
      # @param page_size [Integer] Number of results to return per page.
      # @param phone_numbers [String] If provided, will only return contacts matching the phone numbers; multiple
      #  phone numbers can be separated by commas.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::PaginatedLeadList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.leads.list
      def list(converted_account_id: nil, converted_contact_id: nil, created_after: nil, created_before: nil,
               cursor: nil, email_addresses: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, include_remote_fields: nil, include_shell_data: nil, modified_after: nil, modified_before: nil, owner_id: nil, page_size: nil, phone_numbers: nil, remote_id: nil, request_options: nil)
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
            "converted_account_id": converted_account_id,
            "converted_contact_id": converted_contact_id,
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "email_addresses": email_addresses,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_remote_fields": include_remote_fields,
            "include_shell_data": include_shell_data,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "owner_id": owner_id,
            "page_size": page_size,
            "phone_numbers": phone_numbers,
            "remote_id": remote_id
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/leads"
        end
        Merge::Crm::PaginatedLeadList.from_json(json_object: response.body)
      end

      # Creates a `Lead` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Crm::LeadRequest, as a Hash
      #   * :owner (Hash)
      #   * :lead_source (String)
      #   * :title (String)
      #   * :company (String)
      #   * :first_name (String)
      #   * :last_name (String)
      #   * :addresses (Array<Merge::Crm::AddressRequest>)
      #   * :email_addresses (Array<Merge::Crm::EmailAddressRequest>)
      #   * :phone_numbers (Array<Merge::Crm::PhoneNumberRequest>)
      #   * :converted_date (DateTime)
      #   * :converted_contact (Hash)
      #   * :converted_account (Hash)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      #   * :remote_fields (Array<Merge::Crm::RemoteFieldRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::LeadResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.leads.create(model: {  })
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
          req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/leads"
        end
        Merge::Crm::LeadResponse.from_json(json_object: response.body)
      end

      # Returns a `Lead` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Crm::Leads::LeadsRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::Lead]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.leads.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, include_remote_fields: nil, request_options: nil)
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
            "include_remote_fields": include_remote_fields
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/leads/#{id}"
        end
        Merge::Crm::Lead.from_json(json_object: response.body)
      end

      # Returns metadata for `Lead` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.leads.meta_post_retrieve
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
          req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/leads/meta/post"
        end
        Merge::Crm::MetaResponse.from_json(json_object: response.body)
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
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param is_common_model_field [Boolean] If provided, will only return remote field classes with this
      #  is_common_model_field value
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::PaginatedRemoteFieldClassList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.leads.remote_field_classes_list
      def remote_field_classes_list(cursor: nil, include_deleted_data: nil, include_remote_data: nil,
                                    include_remote_fields: nil, include_shell_data: nil, is_common_model_field: nil, page_size: nil, request_options: nil)
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
            "include_remote_fields": include_remote_fields,
            "include_shell_data": include_shell_data,
            "is_common_model_field": is_common_model_field,
            "page_size": page_size
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/leads/remote-field-classes"
        end
        Merge::Crm::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
      end
    end

    class AsyncLeadsClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Crm::AsyncLeadsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Lead` objects.
      #
      # @param converted_account_id [String] If provided, will only return leads with this account.
      # @param converted_contact_id [String] If provided, will only return leads with this contact.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param email_addresses [String] If provided, will only return contacts matching the email addresses; multiple
      #  email_addresses can be separated by commas.
      # @param expand [Merge::Crm::Leads::LeadsListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
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
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param owner_id [String] If provided, will only return leads with this owner.
      # @param page_size [Integer] Number of results to return per page.
      # @param phone_numbers [String] If provided, will only return contacts matching the phone numbers; multiple
      #  phone numbers can be separated by commas.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::PaginatedLeadList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.leads.list
      def list(converted_account_id: nil, converted_contact_id: nil, created_after: nil, created_before: nil,
               cursor: nil, email_addresses: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, include_remote_fields: nil, include_shell_data: nil, modified_after: nil, modified_before: nil, owner_id: nil, page_size: nil, phone_numbers: nil, remote_id: nil, request_options: nil)
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
              "converted_account_id": converted_account_id,
              "converted_contact_id": converted_contact_id,
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "email_addresses": email_addresses,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_remote_fields": include_remote_fields,
              "include_shell_data": include_shell_data,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "owner_id": owner_id,
              "page_size": page_size,
              "phone_numbers": phone_numbers,
              "remote_id": remote_id
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/leads"
          end
          Merge::Crm::PaginatedLeadList.from_json(json_object: response.body)
        end
      end

      # Creates a `Lead` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Crm::LeadRequest, as a Hash
      #   * :owner (Hash)
      #   * :lead_source (String)
      #   * :title (String)
      #   * :company (String)
      #   * :first_name (String)
      #   * :last_name (String)
      #   * :addresses (Array<Merge::Crm::AddressRequest>)
      #   * :email_addresses (Array<Merge::Crm::EmailAddressRequest>)
      #   * :phone_numbers (Array<Merge::Crm::PhoneNumberRequest>)
      #   * :converted_date (DateTime)
      #   * :converted_contact (Hash)
      #   * :converted_account (Hash)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      #   * :remote_fields (Array<Merge::Crm::RemoteFieldRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::LeadResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.leads.create(model: {  })
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
            req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/leads"
          end
          Merge::Crm::LeadResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `Lead` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Crm::Leads::LeadsRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::Lead]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.leads.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, include_remote_fields: nil, request_options: nil)
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
              "include_remote_fields": include_remote_fields
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/leads/#{id}"
          end
          Merge::Crm::Lead.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Lead` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.leads.meta_post_retrieve
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
            req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/leads/meta/post"
          end
          Merge::Crm::MetaResponse.from_json(json_object: response.body)
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
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param is_common_model_field [Boolean] If provided, will only return remote field classes with this
      #  is_common_model_field value
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::PaginatedRemoteFieldClassList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.leads.remote_field_classes_list
      def remote_field_classes_list(cursor: nil, include_deleted_data: nil, include_remote_data: nil,
                                    include_remote_fields: nil, include_shell_data: nil, is_common_model_field: nil, page_size: nil, request_options: nil)
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
              "include_remote_fields": include_remote_fields,
              "include_shell_data": include_shell_data,
              "is_common_model_field": is_common_model_field,
              "page_size": page_size
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/leads/remote-field-classes"
          end
          Merge::Crm::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
        end
      end
    end
  end
end
