# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/paginated_sync_status_list"
require "async"

module Merge
  module Hris
    class SyncStatusClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Hris::SyncStatusClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Get syncing status. Possible values: `DISABLED`, `DONE`, `FAILED`,
      #  `PARTIALLY_SYNCED`, `PAUSED`, `SYNCING`. Learn more about sync status in our
      #  [Help Center](https://help.merge.dev/en/articles/8184193-merge-sync-statuses).
      #
      # @param cursor [String] The pagination cursor value.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::PaginatedSyncStatusList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.sync_status.list
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
          req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/sync-status"
        end
        Merge::Hris::PaginatedSyncStatusList.from_json(json_object: response.body)
      end
    end

    class AsyncSyncStatusClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Hris::AsyncSyncStatusClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Get syncing status. Possible values: `DISABLED`, `DONE`, `FAILED`,
      #  `PARTIALLY_SYNCED`, `PAUSED`, `SYNCING`. Learn more about sync status in our
      #  [Help Center](https://help.merge.dev/en/articles/8184193-merge-sync-statuses).
      #
      # @param cursor [String] The pagination cursor value.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::PaginatedSyncStatusList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.sync_status.list
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
            req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/sync-status"
          end
          Merge::Hris::PaginatedSyncStatusList.from_json(json_object: response.body)
        end
      end
    end
  end
end
