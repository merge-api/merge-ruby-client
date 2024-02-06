# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "../types/paginated_account_list"
require_relative "../types/account_request"
require_relative "../types/crm_account_response"
require_relative "../types/account"
require_relative "../types/patched_account_request"
require_relative "../types/meta_response"
require_relative "../types/paginated_remote_field_class_list"
require "async"

module Merge
  module Crm
    class AccountsClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Crm::AccountsClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `Account` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param name [String] If provided, will only return accounts with this name.
      # @param owner_id [String] If provided, will only return accounts with this owner.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_options [RequestOptions]
      # @return [Crm::PaginatedAccountList]
      def list(created_after: nil, created_before: nil, cursor: nil, expand: nil, include_deleted_data: nil,
               include_remote_data: nil, include_remote_fields: nil, modified_after: nil, modified_before: nil, name: nil, owner_id: nil, page_size: nil, remote_id: nil, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/accounts") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_remote_fields": include_remote_fields,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "name": name,
            "owner_id": owner_id,
            "page_size": page_size,
            "remote_id": remote_id
          }.compact
        end
        Crm::PaginatedAccountList.from_json(json_object: response.body)
      end

      # Creates an `Account` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Crm::AccountRequest, as a Hash
      #   * :owner (Hash)
      #   * :name (String)
      #   * :description (String)
      #   * :industry (String)
      #   * :website (String)
      #   * :number_of_employees (Integer)
      #   * :last_activity_at (DateTime)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      #   * :remote_fields (Array<Crm::RemoteFieldRequest>)
      # @param request_options [RequestOptions]
      # @return [Crm::CrmAccountResponse]
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.post("/api/crm/v1/accounts") do |req|
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
        Crm::CrmAccountResponse.from_json(json_object: response.body)
      end

      # Returns an `Account` object with the given `id`.
      #
      # @param id [String]
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param request_options [RequestOptions]
      # @return [Crm::Account]
      def retrieve(id:, expand: nil, include_remote_data: nil, include_remote_fields: nil, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/accounts/#{id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "expand": expand,
            "include_remote_data": include_remote_data,
            "include_remote_fields": include_remote_fields
          }.compact
        end
        Crm::Account.from_json(json_object: response.body)
      end

      # Updates an `Account` object with the given `id`.
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Crm::PatchedAccountRequest, as a Hash
      #   * :owner (String)
      #   * :name (String)
      #   * :description (String)
      #   * :industry (String)
      #   * :website (String)
      #   * :number_of_employees (Integer)
      #   * :last_activity_at (DateTime)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      #   * :remote_fields (Array<Crm::RemoteFieldRequest>)
      # @param request_options [RequestOptions]
      # @return [Crm::CrmAccountResponse]
      def partial_update(id:, model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.patch("/api/crm/v1/accounts/#{id}") do |req|
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
        Crm::CrmAccountResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `CRMAccount` PATCHs.
      #
      # @param id [String]
      # @param request_options [RequestOptions]
      # @return [Crm::MetaResponse]
      def meta_patch_retrieve(id:, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/accounts/meta/patch/#{id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Crm::MetaResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `CRMAccount` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Crm::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/accounts/meta/post") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Crm::MetaResponse.from_json(json_object: response.body)
      end

      # Returns a list of `RemoteFieldClass` objects.
      #
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [RequestOptions]
      # @return [Crm::PaginatedRemoteFieldClassList]
      def remote_field_classes_list(cursor: nil, include_deleted_data: nil, include_remote_data: nil,
                                    include_remote_fields: nil, page_size: nil, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/accounts/remote-field-classes") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "cursor": cursor,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_remote_fields": include_remote_fields,
            "page_size": page_size
          }.compact
        end
        Crm::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
      end
    end

    class AsyncAccountsClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Crm::AsyncAccountsClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `Account` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param name [String] If provided, will only return accounts with this name.
      # @param owner_id [String] If provided, will only return accounts with this owner.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_options [RequestOptions]
      # @return [Crm::PaginatedAccountList]
      def list(created_after: nil, created_before: nil, cursor: nil, expand: nil, include_deleted_data: nil,
               include_remote_data: nil, include_remote_fields: nil, modified_after: nil, modified_before: nil, name: nil, owner_id: nil, page_size: nil, remote_id: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/accounts") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_remote_fields": include_remote_fields,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "name": name,
              "owner_id": owner_id,
              "page_size": page_size,
              "remote_id": remote_id
            }.compact
          end
          Crm::PaginatedAccountList.from_json(json_object: response.body)
        end
      end

      # Creates an `Account` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Crm::AccountRequest, as a Hash
      #   * :owner (Hash)
      #   * :name (String)
      #   * :description (String)
      #   * :industry (String)
      #   * :website (String)
      #   * :number_of_employees (Integer)
      #   * :last_activity_at (DateTime)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      #   * :remote_fields (Array<Crm::RemoteFieldRequest>)
      # @param request_options [RequestOptions]
      # @return [Crm::CrmAccountResponse]
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/crm/v1/accounts") do |req|
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
          Crm::CrmAccountResponse.from_json(json_object: response.body)
        end
      end

      # Returns an `Account` object with the given `id`.
      #
      # @param id [String]
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param request_options [RequestOptions]
      # @return [Crm::Account]
      def retrieve(id:, expand: nil, include_remote_data: nil, include_remote_fields: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/accounts/#{id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "expand": expand,
              "include_remote_data": include_remote_data,
              "include_remote_fields": include_remote_fields
            }.compact
          end
          Crm::Account.from_json(json_object: response.body)
        end
      end

      # Updates an `Account` object with the given `id`.
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Crm::PatchedAccountRequest, as a Hash
      #   * :owner (String)
      #   * :name (String)
      #   * :description (String)
      #   * :industry (String)
      #   * :website (String)
      #   * :number_of_employees (Integer)
      #   * :last_activity_at (DateTime)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      #   * :remote_fields (Array<Crm::RemoteFieldRequest>)
      # @param request_options [RequestOptions]
      # @return [Crm::CrmAccountResponse]
      def partial_update(id:, model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.patch("/api/crm/v1/accounts/#{id}") do |req|
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
          Crm::CrmAccountResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `CRMAccount` PATCHs.
      #
      # @param id [String]
      # @param request_options [RequestOptions]
      # @return [Crm::MetaResponse]
      def meta_patch_retrieve(id:, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/accounts/meta/patch/#{id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Crm::MetaResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `CRMAccount` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Crm::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/accounts/meta/post") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Crm::MetaResponse.from_json(json_object: response.body)
        end
      end

      # Returns a list of `RemoteFieldClass` objects.
      #
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [RequestOptions]
      # @return [Crm::PaginatedRemoteFieldClassList]
      def remote_field_classes_list(cursor: nil, include_deleted_data: nil, include_remote_data: nil,
                                    include_remote_fields: nil, page_size: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/accounts/remote-field-classes") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "cursor": cursor,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_remote_fields": include_remote_fields,
              "page_size": page_size
            }.compact
          end
          Crm::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
        end
      end
    end
  end
end
