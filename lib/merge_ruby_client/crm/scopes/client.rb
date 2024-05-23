# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/common_model_scope_api"
require_relative "../types/individual_common_model_scope_deserializer_request"
require "async"

module Merge
  module Crm
    class ScopesClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Crm::ScopesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Get the default permissions for Merge Common Models and fields across all Linked
      #  Accounts of a given category. [Learn
      #  more](https://help.merge.dev/en/articles/8828211-common-model-and-field-scopes).
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::CommonModelScopeApi]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.default_scopes_retrieve
      def default_scopes_retrieve(request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/default-scopes"
        end
        Merge::Crm::CommonModelScopeApi.from_json(json_object: response.body)
      end

      # Get all available permissions for Merge Common Models and fields for a single
      #  Linked Account. [Learn
      #  more](https://help.merge.dev/en/articles/8828211-common-model-and-field-scopes).
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::CommonModelScopeApi]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.linked_account_scopes_retrieve
      def linked_account_scopes_retrieve(request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/linked-account-scopes"
        end
        Merge::Crm::CommonModelScopeApi.from_json(json_object: response.body)
      end

      # Update permissions for any Common Model or field for a single Linked Account.
      #  Any Scopes not set in this POST request will inherit the default Scopes. [Learn
      #  more](https://help.merge.dev/en/articles/8828211-common-model-and-field-scopes)
      #
      # @param common_models [Array<Hash>] The common models you want to update the scopes forRequest of type Array<Merge::Crm::IndividualCommonModelScopeDeserializerRequest>, as a Hash
      #   * :model_name (String)
      #   * :model_permissions (Hash{String => Merge::Crm::ModelPermissionDeserializerRequest})
      #   * :field_permissions (Hash)
      #     * :enabled (Array<Object>)
      #     * :disabled (Array<Object>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::CommonModelScopeApi]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.linked_account_scopes_create(common_models: [{ model_name: "Employee", model_permissions: { "READ": { is_enabled: true }, "WRITE": { is_enabled: false } } }, { model_name: "Benefit", model_permissions: { "WRITE": { is_enabled: false } } }])
      def linked_account_scopes_create(common_models:, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), common_models: common_models }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/linked-account-scopes"
        end
        Merge::Crm::CommonModelScopeApi.from_json(json_object: response.body)
      end
    end

    class AsyncScopesClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Crm::AsyncScopesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Get the default permissions for Merge Common Models and fields across all Linked
      #  Accounts of a given category. [Learn
      #  more](https://help.merge.dev/en/articles/8828211-common-model-and-field-scopes).
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::CommonModelScopeApi]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.default_scopes_retrieve
      def default_scopes_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/default-scopes"
          end
          Merge::Crm::CommonModelScopeApi.from_json(json_object: response.body)
        end
      end

      # Get all available permissions for Merge Common Models and fields for a single
      #  Linked Account. [Learn
      #  more](https://help.merge.dev/en/articles/8828211-common-model-and-field-scopes).
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::CommonModelScopeApi]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.linked_account_scopes_retrieve
      def linked_account_scopes_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/linked-account-scopes"
          end
          Merge::Crm::CommonModelScopeApi.from_json(json_object: response.body)
        end
      end

      # Update permissions for any Common Model or field for a single Linked Account.
      #  Any Scopes not set in this POST request will inherit the default Scopes. [Learn
      #  more](https://help.merge.dev/en/articles/8828211-common-model-and-field-scopes)
      #
      # @param common_models [Array<Hash>] The common models you want to update the scopes forRequest of type Array<Merge::Crm::IndividualCommonModelScopeDeserializerRequest>, as a Hash
      #   * :model_name (String)
      #   * :model_permissions (Hash{String => Merge::Crm::ModelPermissionDeserializerRequest})
      #   * :field_permissions (Hash)
      #     * :enabled (Array<Object>)
      #     * :disabled (Array<Object>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::CommonModelScopeApi]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.linked_account_scopes_create(common_models: [{ model_name: "Employee", model_permissions: { "READ": { is_enabled: true }, "WRITE": { is_enabled: false } } }, { model_name: "Benefit", model_permissions: { "WRITE": { is_enabled: false } } }])
      def linked_account_scopes_create(common_models:, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), common_models: common_models }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/linked-account-scopes"
          end
          Merge::Crm::CommonModelScopeApi.from_json(json_object: response.body)
        end
      end
    end
  end
end
