# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/paginated_sync_status_list"
require "async"

module Merge
  module Ticketing
    class SyncStatusClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Ticketing::SyncStatusClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Get syncing status. Possible values: `DISABLED`, `DONE`, `FAILED`, `PARTIALLY_SYNCED`, `PAUSED`, `SYNCING`. Learn more about sync status in our [Help Center](https://help.merge.dev/en/articles/8184193-merge-sync-statuses).
      #
      # @param cursor [String] The pagination cursor value.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [RequestOptions]
      # @return [Ticketing::PaginatedSyncStatusList]
      def list(cursor: nil, page_size: nil, request_options: nil)
        response = @request_client.conn.get("/api/ticketing/v1/sync-status") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "cursor": cursor,
            "page_size": page_size
          }.compact
        end
        Ticketing::PaginatedSyncStatusList.from_json(json_object: response.body)
      end
    end

    class AsyncSyncStatusClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Ticketing::AsyncSyncStatusClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Get syncing status. Possible values: `DISABLED`, `DONE`, `FAILED`, `PARTIALLY_SYNCED`, `PAUSED`, `SYNCING`. Learn more about sync status in our [Help Center](https://help.merge.dev/en/articles/8184193-merge-sync-statuses).
      #
      # @param cursor [String] The pagination cursor value.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [RequestOptions]
      # @return [Ticketing::PaginatedSyncStatusList]
      def list(cursor: nil, page_size: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ticketing/v1/sync-status") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "cursor": cursor,
              "page_size": page_size
            }.compact
          end
          Ticketing::PaginatedSyncStatusList.from_json(json_object: response.body)
        end
      end
    end
  end
end
