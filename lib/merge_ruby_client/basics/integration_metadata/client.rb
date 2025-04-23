# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/integration_metadata"

# client = Merge::Basics::IntegrationMetadata::Client.new(request_client: request_client)
# integrations = client.list

module Merge
  module Basics
    class IntegrationMetadataClient
      # @param request_client [Merge::RequestClient]
      # @return [Merge::Basics::IntegrationMetadata::Client]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of all integrations available in Merge
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Array<Merge::Basics::IntegrationMetadata>] List of integrations with their metadata
      def list(request_options: nil)
        response = @request_client.conn.get do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/organizations/integrations"
        end

        JSON.parse(response.body)["results"].map do |integration|
          Merge::Basics::IntegrationMetadata.from_json(json_object: integration.to_json)
        end
      end
    end

    class AsyncIntegrationMetadataClient
      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Basics::IntegrationMetadata::AsyncClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of all integrations available in Merge
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Array<Merge::Basics::IntegrationMetadata>] List of integrations with their metadata
      def list(request_options: nil)
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
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/organizations/integrations"
          end

          JSON.parse(response.body)["results"].map do |integration|
            Merge::Basics::IntegrationMetadata.from_json(json_object: integration.to_json)
          end
        end
      end
    end
  end
end
