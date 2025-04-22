# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/paginated_sync_status_list"
require "async"

module Merge
  module Accounting
    class SyncStatusClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Accounting::SyncStatusClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Get sync status for the current sync and the most recently finished sync.
      #  `last_sync_start` represents the most recent time any sync began.
      #  `last_sync_finished` represents the most recent time any sync completed. These
      #  timestamps may correspond to different sync instances which may result in a sync
      #  start time being later than a separate sync completed time. To ensure you are
      #  retrieving the latest available data reference the `last_sync_finished`
      #  timestamp where `last_sync_result` is `DONE`. Possible values for `status` and
      #  `last_sync_result` are `DISABLED`, `DONE`, `FAILED`, `PARTIALLY_SYNCED`,
      #  `PAUSED`, `SYNCING`. Learn more about sync status in our [Help
      #  Center](https://help.merge.dev/en/articles/8184193-merge-sync-statuses).
      #
      # @param cursor [String] The pagination cursor value.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedSyncStatusList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.sync_status.list
      def list(cursor: nil, page_size: nil, request_options: nil)
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
            "page_size": page_size
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/sync-status"
        end
        Merge::Accounting::PaginatedSyncStatusList.from_json(json_object: response.body)
      end
    end

    class AsyncSyncStatusClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Accounting::AsyncSyncStatusClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Get sync status for the current sync and the most recently finished sync.
      #  `last_sync_start` represents the most recent time any sync began.
      #  `last_sync_finished` represents the most recent time any sync completed. These
      #  timestamps may correspond to different sync instances which may result in a sync
      #  start time being later than a separate sync completed time. To ensure you are
      #  retrieving the latest available data reference the `last_sync_finished`
      #  timestamp where `last_sync_result` is `DONE`. Possible values for `status` and
      #  `last_sync_result` are `DISABLED`, `DONE`, `FAILED`, `PARTIALLY_SYNCED`,
      #  `PAUSED`, `SYNCING`. Learn more about sync status in our [Help
      #  Center](https://help.merge.dev/en/articles/8184193-merge-sync-statuses).
      #
      # @param cursor [String] The pagination cursor value.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedSyncStatusList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.sync_status.list
      def list(cursor: nil, page_size: nil, request_options: nil)
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
              "page_size": page_size
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/sync-status"
          end
          Merge::Accounting::PaginatedSyncStatusList.from_json(json_object: response.body)
        end
      end
    end
  end
end
