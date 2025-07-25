# frozen_string_literal: true

require_relative "../../../requests"
require "async"

module Merge
  module Organizations
    class IntegrationsClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Organizations::IntegrationsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Lists available integrations for the organization.
      # This endpoint does not require an account token as it provides
      # organization-level information rather than account-specific data.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Array]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.organizations.integrations.list
      def list(request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          # Note: No X-Account-Token header needed for organization-level endpoints
          req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/organizations/integrations"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end

      # Lists available integrations for the organization (async version).
      # This endpoint does not require an account token as it provides
      # organization-level information rather than account-specific data.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Array]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.organizations.integrations.list_async
      def list_async(request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            # Note: No X-Account-Token header needed for organization-level endpoints
            req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/organizations/integrations"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json
        end
      end
    end

    class AsyncIntegrationsClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Organizations::AsyncIntegrationsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Lists available integrations for the organization (async version).
      # This endpoint does not require an account token as it provides
      # organization-level information rather than account-specific data.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Array]
      # @example
      #  api = Merge::AsyncClient.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.organizations.integrations.list
      def list(request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            # Note: No X-Account-Token header needed for organization-level endpoints
            req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/organizations/integrations"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json
        end
      end
    end
  end
end