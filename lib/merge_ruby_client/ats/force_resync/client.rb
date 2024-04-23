# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/sync_status"
require "json"
require "async"

module Merge
  module Ats
    class ForceResyncClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Ats::ForceResyncClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Force re-sync of all models. This is available for all organizations via the
      #  dashboard. Force re-sync is also available programmatically via API for monthly,
      #  quarterly, and highest sync frequency customers on the Launch, Professional, or
      #  Enterprise plans. Doing so will consume a sync credit for the relevant linked
      #  account.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Array<Merge::Ats::SyncStatus>]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.sync_status_resync_create
      def sync_status_resync_create(request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/sync-status/resync"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |v|
          v = v.to_json
          Merge::Ats::SyncStatus.from_json(json_object: v)
        end
      end
    end

    class AsyncForceResyncClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Ats::AsyncForceResyncClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Force re-sync of all models. This is available for all organizations via the
      #  dashboard. Force re-sync is also available programmatically via API for monthly,
      #  quarterly, and highest sync frequency customers on the Launch, Professional, or
      #  Enterprise plans. Doing so will consume a sync credit for the relevant linked
      #  account.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Array<Merge::Ats::SyncStatus>]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.sync_status_resync_create
      def sync_status_resync_create(request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/sync-status/resync"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |v|
            v = v.to_json
            Merge::Ats::SyncStatus.from_json(json_object: v)
          end
        end
      end
    end
  end
end
