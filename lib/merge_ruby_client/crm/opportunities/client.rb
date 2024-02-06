# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/opportunities_list_request_expand"
require_relative "types/opportunities_list_request_status"
require_relative "../types/paginated_opportunity_list"
require_relative "../types/opportunity_request"
require_relative "../types/opportunity_response"
require_relative "types/opportunities_retrieve_request_expand"
require_relative "../types/opportunity"
require_relative "../types/patched_opportunity_request"
require_relative "../types/meta_response"
require_relative "../types/paginated_remote_field_class_list"
require "async"

module Merge
  module Crm
    class OpportunitiesClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Crm::OpportunitiesClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `Opportunity` objects.
      #
      # @param account_id [String] If provided, will only return opportunities with this account.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [OPPORTUNITIES_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param owner_id [String] If provided, will only return opportunities with this owner.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [String] Which fields should be returned in non-normalized form.
      # @param stage_id [String] If provided, will only return opportunities with this stage.
      # @param status [OPPORTUNITIES_LIST_REQUEST_STATUS] If provided, will only return opportunities with this status. Options: ('OPEN', 'WON', 'LOST')
      #   - `OPEN` - OPEN
      #   - `WON` - WON
      #   - `LOST` - LOST
      # @param request_options [RequestOptions]
      # @return [Crm::PaginatedOpportunityList]
      def list(account_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, include_remote_fields: nil, modified_after: nil, modified_before: nil, owner_id: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, stage_id: nil, status: nil, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/opportunities") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "account_id": account_id,
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_remote_fields": include_remote_fields,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "owner_id": owner_id,
            "page_size": page_size,
            "remote_fields": remote_fields,
            "remote_id": remote_id,
            "show_enum_origins": show_enum_origins,
            "stage_id": stage_id,
            "status": status
          }.compact
        end
        Crm::PaginatedOpportunityList.from_json(json_object: response.body)
      end

      # Creates an `Opportunity` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Crm::OpportunityRequest, as a Hash
      #   * :name (String)
      #   * :description (String)
      #   * :amount (Integer)
      #   * :owner (Hash)
      #   * :account (Hash)
      #   * :stage (Hash)
      #   * :status (Hash)
      #   * :last_activity_at (DateTime)
      #   * :close_date (DateTime)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      #   * :remote_fields (Array<Crm::RemoteFieldRequest>)
      # @param request_options [RequestOptions]
      # @return [Crm::OpportunityResponse]
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.post("/api/crm/v1/opportunities") do |req|
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
        Crm::OpportunityResponse.from_json(json_object: response.body)
      end

      # Returns an `Opportunity` object with the given `id`.
      #
      # @param id [String]
      # @param expand [OPPORTUNITIES_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [String] Which fields should be returned in non-normalized form.
      # @param request_options [RequestOptions]
      # @return [Crm::Opportunity]
      def retrieve(id:, expand: nil, include_remote_data: nil, include_remote_fields: nil, remote_fields: nil,
                   show_enum_origins: nil, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/opportunities/#{id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "expand": expand,
            "include_remote_data": include_remote_data,
            "include_remote_fields": include_remote_fields,
            "remote_fields": remote_fields,
            "show_enum_origins": show_enum_origins
          }.compact
        end
        Crm::Opportunity.from_json(json_object: response.body)
      end

      # Updates an `Opportunity` object with the given `id`.
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Crm::PatchedOpportunityRequest, as a Hash
      #   * :name (String)
      #   * :description (String)
      #   * :amount (Integer)
      #   * :owner (String)
      #   * :account (String)
      #   * :stage (String)
      #   * :status (Hash)
      #   * :last_activity_at (DateTime)
      #   * :close_date (DateTime)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      #   * :remote_fields (Array<Crm::RemoteFieldRequest>)
      # @param request_options [RequestOptions]
      # @return [Crm::OpportunityResponse]
      def partial_update(id:, model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.patch("/api/crm/v1/opportunities/#{id}") do |req|
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
        Crm::OpportunityResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `Opportunity` PATCHs.
      #
      # @param id [String]
      # @param request_options [RequestOptions]
      # @return [Crm::MetaResponse]
      def meta_patch_retrieve(id:, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/opportunities/meta/patch/#{id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Crm::MetaResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `Opportunity` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Crm::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/opportunities/meta/post") do |req|
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
        response = @request_client.conn.get("/api/crm/v1/opportunities/remote-field-classes") do |req|
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

    class AsyncOpportunitiesClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Crm::AsyncOpportunitiesClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `Opportunity` objects.
      #
      # @param account_id [String] If provided, will only return opportunities with this account.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [OPPORTUNITIES_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param owner_id [String] If provided, will only return opportunities with this owner.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [String] Which fields should be returned in non-normalized form.
      # @param stage_id [String] If provided, will only return opportunities with this stage.
      # @param status [OPPORTUNITIES_LIST_REQUEST_STATUS] If provided, will only return opportunities with this status. Options: ('OPEN', 'WON', 'LOST')
      #   - `OPEN` - OPEN
      #   - `WON` - WON
      #   - `LOST` - LOST
      # @param request_options [RequestOptions]
      # @return [Crm::PaginatedOpportunityList]
      def list(account_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, include_remote_fields: nil, modified_after: nil, modified_before: nil, owner_id: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, stage_id: nil, status: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/opportunities") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "account_id": account_id,
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_remote_fields": include_remote_fields,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "owner_id": owner_id,
              "page_size": page_size,
              "remote_fields": remote_fields,
              "remote_id": remote_id,
              "show_enum_origins": show_enum_origins,
              "stage_id": stage_id,
              "status": status
            }.compact
          end
          Crm::PaginatedOpportunityList.from_json(json_object: response.body)
        end
      end

      # Creates an `Opportunity` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Crm::OpportunityRequest, as a Hash
      #   * :name (String)
      #   * :description (String)
      #   * :amount (Integer)
      #   * :owner (Hash)
      #   * :account (Hash)
      #   * :stage (Hash)
      #   * :status (Hash)
      #   * :last_activity_at (DateTime)
      #   * :close_date (DateTime)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      #   * :remote_fields (Array<Crm::RemoteFieldRequest>)
      # @param request_options [RequestOptions]
      # @return [Crm::OpportunityResponse]
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/crm/v1/opportunities") do |req|
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
          Crm::OpportunityResponse.from_json(json_object: response.body)
        end
      end

      # Returns an `Opportunity` object with the given `id`.
      #
      # @param id [String]
      # @param expand [OPPORTUNITIES_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [String] Which fields should be returned in non-normalized form.
      # @param request_options [RequestOptions]
      # @return [Crm::Opportunity]
      def retrieve(id:, expand: nil, include_remote_data: nil, include_remote_fields: nil, remote_fields: nil,
                   show_enum_origins: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/opportunities/#{id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "expand": expand,
              "include_remote_data": include_remote_data,
              "include_remote_fields": include_remote_fields,
              "remote_fields": remote_fields,
              "show_enum_origins": show_enum_origins
            }.compact
          end
          Crm::Opportunity.from_json(json_object: response.body)
        end
      end

      # Updates an `Opportunity` object with the given `id`.
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Crm::PatchedOpportunityRequest, as a Hash
      #   * :name (String)
      #   * :description (String)
      #   * :amount (Integer)
      #   * :owner (String)
      #   * :account (String)
      #   * :stage (String)
      #   * :status (Hash)
      #   * :last_activity_at (DateTime)
      #   * :close_date (DateTime)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      #   * :remote_fields (Array<Crm::RemoteFieldRequest>)
      # @param request_options [RequestOptions]
      # @return [Crm::OpportunityResponse]
      def partial_update(id:, model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.patch("/api/crm/v1/opportunities/#{id}") do |req|
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
          Crm::OpportunityResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Opportunity` PATCHs.
      #
      # @param id [String]
      # @param request_options [RequestOptions]
      # @return [Crm::MetaResponse]
      def meta_patch_retrieve(id:, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/opportunities/meta/patch/#{id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Crm::MetaResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Opportunity` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Crm::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/opportunities/meta/post") do |req|
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
          response = @request_client.conn.get("/api/crm/v1/opportunities/remote-field-classes") do |req|
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
