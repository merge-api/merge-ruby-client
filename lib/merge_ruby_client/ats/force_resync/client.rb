# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/sync_status"
require "async"

module Merge
  module Ats
    class ForceResyncClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Ats::ForceResyncClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Force re-sync of all models. This is available for all organizations via the dashboard. Force re-sync is also available programmatically via API for monthly, quarterly, and highest sync frequency customers on the Core, Professional, or Enterprise plans. Doing so will consume a sync credit for the relevant linked account.
      #
      # @param request_options [RequestOptions]
      # @return [Array<Ats::SyncStatus>]
      def sync_status_resync_create(request_options: nil)
        response = @request_client.conn.post("/api/ats/v1/sync-status/resync") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        return if response.body.nil?

        response.body.map do |v|
          v = v.to_json
          Ats::SyncStatus.from_json(json_object: v)
        end
      end
    end

    class AsyncForceResyncClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Ats::AsyncForceResyncClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Force re-sync of all models. This is available for all organizations via the dashboard. Force re-sync is also available programmatically via API for monthly, quarterly, and highest sync frequency customers on the Core, Professional, or Enterprise plans. Doing so will consume a sync credit for the relevant linked account.
      #
      # @param request_options [RequestOptions]
      # @return [Array<Ats::SyncStatus>]
      def sync_status_resync_create(request_options: nil)
        Async do
          response = @request_client.conn.post("/api/ats/v1/sync-status/resync") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          response.body&.map do |v|
            v = v.to_json
            Ats::SyncStatus.from_json(json_object: v)
          end
        end
      end
    end
  end
end
