# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/linked_account_selective_sync_configuration"
require "json"
require_relative "../types/linked_account_selective_sync_configuration_request"
require_relative "../types/paginated_condition_schema_list"
require "async"

module Merge
  module Accounting
    class SelectiveSyncClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Accounting::SelectiveSyncClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Get a linked account's selective syncs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Array<Merge::Accounting::LinkedAccountSelectiveSyncConfiguration>]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.configurations_list
      def configurations_list(request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/selective-sync/configurations"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |v|
          v = v.to_json
          Merge::Accounting::LinkedAccountSelectiveSyncConfiguration.from_json(json_object: v)
        end
      end

      # Replace a linked account's selective syncs.
      #
      # @param sync_configurations [Array<Hash>] The selective syncs associated with a linked account.Request of type Array<Merge::Accounting::LinkedAccountSelectiveSyncConfigurationRequest>, as a Hash
      #   * :linked_account_conditions (Array<Merge::Accounting::LinkedAccountConditionRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Array<Merge::Accounting::LinkedAccountSelectiveSyncConfiguration>]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.configurations_update(sync_configurations: [{ linked_account_conditions:  }])
      def configurations_update(sync_configurations:, request_options: nil)
        response = @request_client.conn.put do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            sync_configurations: sync_configurations
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/selective-sync/configurations"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |v|
          v = v.to_json
          Merge::Accounting::LinkedAccountSelectiveSyncConfiguration.from_json(json_object: v)
        end
      end

      # Get metadata for the conditions available to a linked account.
      #
      # @param common_model [String]
      # @param cursor [String] The pagination cursor value.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedConditionSchemaList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.meta_list
      def meta_list(common_model: nil, cursor: nil, page_size: nil, request_options: nil)
        response = @request_client.conn.get do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/selective-sync/meta"
        end
        Merge::Accounting::PaginatedConditionSchemaList.from_json(json_object: response.body)
      end
    end

    class AsyncSelectiveSyncClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Accounting::AsyncSelectiveSyncClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Get a linked account's selective syncs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Array<Merge::Accounting::LinkedAccountSelectiveSyncConfiguration>]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.configurations_list
      def configurations_list(request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/selective-sync/configurations"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |v|
            v = v.to_json
            Merge::Accounting::LinkedAccountSelectiveSyncConfiguration.from_json(json_object: v)
          end
        end
      end

      # Replace a linked account's selective syncs.
      #
      # @param sync_configurations [Array<Hash>] The selective syncs associated with a linked account.Request of type Array<Merge::Accounting::LinkedAccountSelectiveSyncConfigurationRequest>, as a Hash
      #   * :linked_account_conditions (Array<Merge::Accounting::LinkedAccountConditionRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Array<Merge::Accounting::LinkedAccountSelectiveSyncConfiguration>]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.configurations_update(sync_configurations: [{ linked_account_conditions:  }])
      def configurations_update(sync_configurations:, request_options: nil)
        Async do
          response = @request_client.conn.put do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              sync_configurations: sync_configurations
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/selective-sync/configurations"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |v|
            v = v.to_json
            Merge::Accounting::LinkedAccountSelectiveSyncConfiguration.from_json(json_object: v)
          end
        end
      end

      # Get metadata for the conditions available to a linked account.
      #
      # @param common_model [String]
      # @param cursor [String] The pagination cursor value.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedConditionSchemaList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.meta_list
      def meta_list(common_model: nil, cursor: nil, page_size: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/selective-sync/meta"
          end
          Merge::Accounting::PaginatedConditionSchemaList.from_json(json_object: response.body)
        end
      end
    end
  end
end
