# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/field_mapping_api_instance_response"
require "async"

module Merge
  module Hris
    class FieldMappingClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Hris::FieldMappingClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Get all Field Mappings for this Linked Account. Field Mappings are mappings
      #  between third-party Remote Fields and user defined Merge fields. [Learn
      #  more](https://docs.merge.dev/supplemental-data/field-mappings/overview/).
      #
      # @param exclude_remote_field_metadata [Boolean] If `true`, remote fields metadata is excluded from each field mapping instance
      #  (i.e. `remote_fields.remote_key_name` and `remote_fields.schema` will be null).
      #  This will increase the speed of the request since these fields require some
      #  calculations.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::FieldMappingApiInstanceResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.field_mapping.field_mappings_retrieve
      def field_mappings_retrieve(exclude_remote_field_metadata: nil, request_options: nil)
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
            "exclude_remote_field_metadata": exclude_remote_field_metadata
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/field-mappings"
        end
        Merge::Hris::FieldMappingApiInstanceResponse.from_json(json_object: response.body)
      end
    end

    class AsyncFieldMappingClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Hris::AsyncFieldMappingClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Get all Field Mappings for this Linked Account. Field Mappings are mappings
      #  between third-party Remote Fields and user defined Merge fields. [Learn
      #  more](https://docs.merge.dev/supplemental-data/field-mappings/overview/).
      #
      # @param exclude_remote_field_metadata [Boolean] If `true`, remote fields metadata is excluded from each field mapping instance
      #  (i.e. `remote_fields.remote_key_name` and `remote_fields.schema` will be null).
      #  This will increase the speed of the request since these fields require some
      #  calculations.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::FieldMappingApiInstanceResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.field_mapping.field_mappings_retrieve
      def field_mappings_retrieve(exclude_remote_field_metadata: nil, request_options: nil)
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
              "exclude_remote_field_metadata": exclude_remote_field_metadata
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/field-mappings"
          end
          Merge::Hris::FieldMappingApiInstanceResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
