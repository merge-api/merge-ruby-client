# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/linked_account_selective_sync_configuration"
require_relative "../types/linked_account_selective_sync_configuration_request"
require_relative "../types/paginated_condition_schema_list"
require "async"

module Merge
  module Hris
    class SelectiveSyncClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Hris::SelectiveSyncClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Get a linked account's selective syncs.
      #
      # @param request_options [RequestOptions]
      # @return [Array<Hris::LinkedAccountSelectiveSyncConfiguration>]
      def configurations_list(request_options: nil)
        response = @request_client.conn.get("/api/hris/v1/selective-sync/configurations") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        return if response.body.nil?

        response.body.map do |v|
          v = v.to_json
          Hris::LinkedAccountSelectiveSyncConfiguration.from_json(json_object: v)
        end
      end

      # Replace a linked account's selective syncs.
      #
      # @param sync_configurations [Array<Hash>] The selective syncs associated with a linked account.Request of type Array<Hris::LinkedAccountSelectiveSyncConfigurationRequest>, as a Hash
      #   * :linked_account_conditions (Array<Hris::LinkedAccountConditionRequest>)
      # @param request_options [RequestOptions]
      # @return [Array<Hris::LinkedAccountSelectiveSyncConfiguration>]
      def configurations_update(sync_configurations:, request_options: nil)
        response = @request_client.conn.put("/api/hris/v1/selective-sync/configurations") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            sync_configurations: sync_configurations
          }.compact
        end
        return if response.body.nil?

        response.body.map do |v|
          v = v.to_json
          Hris::LinkedAccountSelectiveSyncConfiguration.from_json(json_object: v)
        end
      end

      # Get metadata for the conditions available to a linked account.
      #
      # @param common_model [String]
      # @param cursor [String] The pagination cursor value.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [RequestOptions]
      # @return [Hris::PaginatedConditionSchemaList]
      def meta_list(common_model: nil, cursor: nil, page_size: nil, request_options: nil)
        response = @request_client.conn.get("/api/hris/v1/selective-sync/meta") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "common_model": common_model,
            "cursor": cursor,
            "page_size": page_size
          }.compact
        end
        Hris::PaginatedConditionSchemaList.from_json(json_object: response.body)
      end
    end

    class AsyncSelectiveSyncClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Hris::AsyncSelectiveSyncClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Get a linked account's selective syncs.
      #
      # @param request_options [RequestOptions]
      # @return [Array<Hris::LinkedAccountSelectiveSyncConfiguration>]
      def configurations_list(request_options: nil)
        Async do
          response = @request_client.conn.get("/api/hris/v1/selective-sync/configurations") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          response.body&.map do |v|
            v = v.to_json
            Hris::LinkedAccountSelectiveSyncConfiguration.from_json(json_object: v)
          end
        end
      end

      # Replace a linked account's selective syncs.
      #
      # @param sync_configurations [Array<Hash>] The selective syncs associated with a linked account.Request of type Array<Hris::LinkedAccountSelectiveSyncConfigurationRequest>, as a Hash
      #   * :linked_account_conditions (Array<Hris::LinkedAccountConditionRequest>)
      # @param request_options [RequestOptions]
      # @return [Array<Hris::LinkedAccountSelectiveSyncConfiguration>]
      def configurations_update(sync_configurations:, request_options: nil)
        Async do
          response = @request_client.conn.put("/api/hris/v1/selective-sync/configurations") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              sync_configurations: sync_configurations
            }.compact
          end
          response.body&.map do |v|
            v = v.to_json
            Hris::LinkedAccountSelectiveSyncConfiguration.from_json(json_object: v)
          end
        end
      end

      # Get metadata for the conditions available to a linked account.
      #
      # @param common_model [String]
      # @param cursor [String] The pagination cursor value.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [RequestOptions]
      # @return [Hris::PaginatedConditionSchemaList]
      def meta_list(common_model: nil, cursor: nil, page_size: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/hris/v1/selective-sync/meta") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "common_model": common_model,
              "cursor": cursor,
              "page_size": page_size
            }.compact
          end
          Hris::PaginatedConditionSchemaList.from_json(json_object: response.body)
        end
      end
    end
  end
end
