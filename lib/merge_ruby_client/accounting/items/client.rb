# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/items_list_request_expand"
require_relative "../types/paginated_item_list"
require_relative "types/items_retrieve_request_expand"
require_relative "../types/item"
require "async"

module Merge
  module Accounting
    class ItemsClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Accounting::ItemsClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `Item` objects.
      #
      # @param company_id [String] If provided, will only return items for this company.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [ITEMS_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [String] Which fields should be returned in non-normalized form.
      # @param request_options [RequestOptions]
      # @return [Accounting::PaginatedItemList]
      def list(company_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, request_options: nil)
        response = @request_client.conn.get("/api/accounting/v1/items") do |req|
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
            "remote_fields": remote_fields,
            "remote_id": remote_id,
            "show_enum_origins": show_enum_origins
          }.compact
        end
        Accounting::PaginatedItemList.from_json(json_object: response.body)
      end

      # Returns an `Item` object with the given `id`.
      #
      # @param id [String]
      # @param expand [ITEMS_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [String] Which fields should be returned in non-normalized form.
      # @param request_options [RequestOptions]
      # @return [Accounting::Item]
      def retrieve(id:, expand: nil, include_remote_data: nil, remote_fields: nil, show_enum_origins: nil,
                   request_options: nil)
        response = @request_client.conn.get("/api/accounting/v1/items/#{id}") do |req|
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
        end
        Accounting::Item.from_json(json_object: response.body)
      end
    end

    class AsyncItemsClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Accounting::AsyncItemsClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `Item` objects.
      #
      # @param company_id [String] If provided, will only return items for this company.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [ITEMS_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [String] Which fields should be returned in non-normalized form.
      # @param request_options [RequestOptions]
      # @return [Accounting::PaginatedItemList]
      def list(company_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/accounting/v1/items") do |req|
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
              "remote_fields": remote_fields,
              "remote_id": remote_id,
              "show_enum_origins": show_enum_origins
            }.compact
          end
          Accounting::PaginatedItemList.from_json(json_object: response.body)
        end
      end

      # Returns an `Item` object with the given `id`.
      #
      # @param id [String]
      # @param expand [ITEMS_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [String] Which fields should be returned in non-normalized form.
      # @param request_options [RequestOptions]
      # @return [Accounting::Item]
      def retrieve(id:, expand: nil, include_remote_data: nil, remote_fields: nil, show_enum_origins: nil,
                   request_options: nil)
        Async do
          response = @request_client.conn.get("/api/accounting/v1/items/#{id}") do |req|
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
          end
          Accounting::Item.from_json(json_object: response.body)
        end
      end
    end
  end
end
