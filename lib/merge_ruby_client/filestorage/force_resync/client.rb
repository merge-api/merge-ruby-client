# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/sync_status"
require "json"
require "async"

module Merge
  module Filestorage
    class ForceResyncClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Filestorage::ForceResyncClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Force re-sync of all models. This endpoint is available for monthly, quarterly,
      #  and highest sync frequency customers on the Professional or Enterprise plans.
      #  Doing so will consume a sync credit for the relevant linked account. Force
      #  re-syncs can also be triggered manually in the Merge Dashboard and is available
      #  for all customers.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Array<Merge::Filestorage::SyncStatus>]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.force_resync.sync_status_resync_create
      def sync_status_resync_create(request_options: nil)
        response = @request_client.conn.post do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/sync-status/resync"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          Merge::Filestorage::SyncStatus.from_json(json_object: item)
        end
      end
    end

    class AsyncForceResyncClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Filestorage::AsyncForceResyncClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Force re-sync of all models. This endpoint is available for monthly, quarterly,
      #  and highest sync frequency customers on the Professional or Enterprise plans.
      #  Doing so will consume a sync credit for the relevant linked account. Force
      #  re-syncs can also be triggered manually in the Merge Dashboard and is available
      #  for all customers.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Array<Merge::Filestorage::SyncStatus>]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.force_resync.sync_status_resync_create
      def sync_status_resync_create(request_options: nil)
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
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/sync-status/resync"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            Merge::Filestorage::SyncStatus.from_json(json_object: item)
          end
        end
      end
    end
  end
end
