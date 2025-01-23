# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/field_mapping_api_instance_response"
require_relative "../types/field_mapping_instance_response"
require_relative "../types/remote_field_api_response"
require_relative "../types/external_target_field_api_response"
require "async"

module Merge
  module Ats
    class FieldMappingClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Ats::FieldMappingClient]
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
      # @return [Merge::Ats::FieldMappingApiInstanceResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.field_mapping.field_mappings_retrieve
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
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/field-mappings"
        end
        Merge::Ats::FieldMappingApiInstanceResponse.from_json(json_object: response.body)
      end

      # Create new Field Mappings that will be available after the next scheduled sync.
      #  This will cause the next sync for this Linked Account to sync **ALL** data from
      #  start.
      #
      # @param exclude_remote_field_metadata [Boolean] If `true`, remote fields metadata is excluded from each field mapping instance
      #  (i.e. `remote_fields.remote_key_name` and `remote_fields.schema` will be null).
      #  This will increase the speed of the request since these fields require some
      #  calculations.
      # @param target_field_name [String] The name of the target field you want this remote field to map to.
      # @param target_field_description [String] The description of the target field you want this remote field to map to.
      # @param remote_field_traversal_path [Array<Object>] The field traversal path of the remote field listed when you hit the GET
      #  /remote-fields endpoint.
      # @param remote_method [String] The method of the remote endpoint where the remote field is coming from.
      # @param remote_url_path [String] The path of the remote endpoint where the remote field is coming from.
      # @param common_model_name [String] The name of the Common Model that the remote field corresponds to in a given
      #  category.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::FieldMappingInstanceResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.field_mapping.field_mappings_create(
      #    target_field_name: "example_target_field_name",
      #    target_field_description: "this is a example description of the target field",
      #    remote_field_traversal_path: ["example_remote_field"],
      #    remote_method: "GET",
      #    remote_url_path: "/example-url-path",
      #    common_model_name: "ExampleCommonModel"
      #  )
      def field_mappings_create(target_field_name:, target_field_description:, remote_field_traversal_path:,
                                remote_method:, remote_url_path:, common_model_name:, exclude_remote_field_metadata: nil, request_options: nil)
        response = @request_client.conn.post do |req|
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
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            target_field_name: target_field_name,
            target_field_description: target_field_description,
            remote_field_traversal_path: remote_field_traversal_path,
            remote_method: remote_method,
            remote_url_path: remote_url_path,
            common_model_name: common_model_name
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/field-mappings"
        end
        Merge::Ats::FieldMappingInstanceResponse.from_json(json_object: response.body)
      end

      # Deletes Field Mappings for a Linked Account. All data related to this Field
      #  Mapping will be deleted and these changes will be reflected after the next
      #  scheduled sync. This will cause the next sync for this Linked Account to sync
      #  **ALL** data from start.
      #
      # @param field_mapping_id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::FieldMappingInstanceResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.field_mapping.field_mappings_destroy(field_mapping_id: "field_mapping_id")
      def field_mappings_destroy(field_mapping_id:, request_options: nil)
        response = @request_client.conn.delete do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/field-mappings/#{field_mapping_id}"
        end
        Merge::Ats::FieldMappingInstanceResponse.from_json(json_object: response.body)
      end

      # Create or update existing Field Mappings for a Linked Account. Changes will be
      #  reflected after the next scheduled sync. This will cause the next sync for this
      #  Linked Account to sync **ALL** data from start.
      #
      # @param field_mapping_id [String]
      # @param remote_field_traversal_path [Array<Object>] The field traversal path of the remote field listed when you hit the GET
      #  /remote-fields endpoint.
      # @param remote_method [String] The method of the remote endpoint where the remote field is coming from.
      # @param remote_url_path [String] The path of the remote endpoint where the remote field is coming from.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::FieldMappingInstanceResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.field_mapping.field_mappings_partial_update(field_mapping_id: "field_mapping_id")
      def field_mappings_partial_update(field_mapping_id:, remote_field_traversal_path: nil, remote_method: nil,
                                        remote_url_path: nil, request_options: nil)
        response = @request_client.conn.patch do |req|
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
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            remote_field_traversal_path: remote_field_traversal_path,
            remote_method: remote_method,
            remote_url_path: remote_url_path
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/field-mappings/#{field_mapping_id}"
        end
        Merge::Ats::FieldMappingInstanceResponse.from_json(json_object: response.body)
      end

      # Get all remote fields for a Linked Account. Remote fields are third-party fields
      #  that are accessible after initial sync if remote_data is enabled. You can use
      #  remote fields to override existing Merge fields or map a new Merge field. [Learn
      #  more](https://docs.merge.dev/supplemental-data/field-mappings/overview/).
      #
      # @param common_models [String] A comma seperated list of Common Model names. If included, will only return
      #  Remote Fields for those Common Models.
      # @param include_example_values [String] If true, will include example values, where available, for remote fields in the
      #  3rd party platform. These examples come from active data from your customers.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::RemoteFieldApiResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.field_mapping.remote_fields_retrieve
      def remote_fields_retrieve(common_models: nil, include_example_values: nil, request_options: nil)
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
            "common_models": common_models,
            "include_example_values": include_example_values
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/remote-fields"
        end
        Merge::Ats::RemoteFieldApiResponse.from_json(json_object: response.body)
      end

      # Get all organization-wide Target Fields, this will not include any Linked
      #  Account specific Target Fields. Organization-wide Target Fields are additional
      #  fields appended to the Merge Common Model for all Linked Accounts in a category.
      #  [Learn
      #  more](https://docs.merge.dev/supplemental-data/field-mappings/target-fields/).
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::ExternalTargetFieldApiResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.field_mapping.target_fields_retrieve
      def target_fields_retrieve(request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/target-fields"
        end
        Merge::Ats::ExternalTargetFieldApiResponse.from_json(json_object: response.body)
      end
    end

    class AsyncFieldMappingClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Ats::AsyncFieldMappingClient]
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
      # @return [Merge::Ats::FieldMappingApiInstanceResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.field_mapping.field_mappings_retrieve
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
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/field-mappings"
          end
          Merge::Ats::FieldMappingApiInstanceResponse.from_json(json_object: response.body)
        end
      end

      # Create new Field Mappings that will be available after the next scheduled sync.
      #  This will cause the next sync for this Linked Account to sync **ALL** data from
      #  start.
      #
      # @param exclude_remote_field_metadata [Boolean] If `true`, remote fields metadata is excluded from each field mapping instance
      #  (i.e. `remote_fields.remote_key_name` and `remote_fields.schema` will be null).
      #  This will increase the speed of the request since these fields require some
      #  calculations.
      # @param target_field_name [String] The name of the target field you want this remote field to map to.
      # @param target_field_description [String] The description of the target field you want this remote field to map to.
      # @param remote_field_traversal_path [Array<Object>] The field traversal path of the remote field listed when you hit the GET
      #  /remote-fields endpoint.
      # @param remote_method [String] The method of the remote endpoint where the remote field is coming from.
      # @param remote_url_path [String] The path of the remote endpoint where the remote field is coming from.
      # @param common_model_name [String] The name of the Common Model that the remote field corresponds to in a given
      #  category.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::FieldMappingInstanceResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.field_mapping.field_mappings_create(
      #    target_field_name: "example_target_field_name",
      #    target_field_description: "this is a example description of the target field",
      #    remote_field_traversal_path: ["example_remote_field"],
      #    remote_method: "GET",
      #    remote_url_path: "/example-url-path",
      #    common_model_name: "ExampleCommonModel"
      #  )
      def field_mappings_create(target_field_name:, target_field_description:, remote_field_traversal_path:,
                                remote_method:, remote_url_path:, common_model_name:, exclude_remote_field_metadata: nil, request_options: nil)
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
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "exclude_remote_field_metadata": exclude_remote_field_metadata
            }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              target_field_name: target_field_name,
              target_field_description: target_field_description,
              remote_field_traversal_path: remote_field_traversal_path,
              remote_method: remote_method,
              remote_url_path: remote_url_path,
              common_model_name: common_model_name
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/field-mappings"
          end
          Merge::Ats::FieldMappingInstanceResponse.from_json(json_object: response.body)
        end
      end

      # Deletes Field Mappings for a Linked Account. All data related to this Field
      #  Mapping will be deleted and these changes will be reflected after the next
      #  scheduled sync. This will cause the next sync for this Linked Account to sync
      #  **ALL** data from start.
      #
      # @param field_mapping_id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::FieldMappingInstanceResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.field_mapping.field_mappings_destroy(field_mapping_id: "field_mapping_id")
      def field_mappings_destroy(field_mapping_id:, request_options: nil)
        Async do
          response = @request_client.conn.delete do |req|
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
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/field-mappings/#{field_mapping_id}"
          end
          Merge::Ats::FieldMappingInstanceResponse.from_json(json_object: response.body)
        end
      end

      # Create or update existing Field Mappings for a Linked Account. Changes will be
      #  reflected after the next scheduled sync. This will cause the next sync for this
      #  Linked Account to sync **ALL** data from start.
      #
      # @param field_mapping_id [String]
      # @param remote_field_traversal_path [Array<Object>] The field traversal path of the remote field listed when you hit the GET
      #  /remote-fields endpoint.
      # @param remote_method [String] The method of the remote endpoint where the remote field is coming from.
      # @param remote_url_path [String] The path of the remote endpoint where the remote field is coming from.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::FieldMappingInstanceResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.field_mapping.field_mappings_partial_update(field_mapping_id: "field_mapping_id")
      def field_mappings_partial_update(field_mapping_id:, remote_field_traversal_path: nil, remote_method: nil,
                                        remote_url_path: nil, request_options: nil)
        Async do
          response = @request_client.conn.patch do |req|
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
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              remote_field_traversal_path: remote_field_traversal_path,
              remote_method: remote_method,
              remote_url_path: remote_url_path
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/field-mappings/#{field_mapping_id}"
          end
          Merge::Ats::FieldMappingInstanceResponse.from_json(json_object: response.body)
        end
      end

      # Get all remote fields for a Linked Account. Remote fields are third-party fields
      #  that are accessible after initial sync if remote_data is enabled. You can use
      #  remote fields to override existing Merge fields or map a new Merge field. [Learn
      #  more](https://docs.merge.dev/supplemental-data/field-mappings/overview/).
      #
      # @param common_models [String] A comma seperated list of Common Model names. If included, will only return
      #  Remote Fields for those Common Models.
      # @param include_example_values [String] If true, will include example values, where available, for remote fields in the
      #  3rd party platform. These examples come from active data from your customers.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::RemoteFieldApiResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.field_mapping.remote_fields_retrieve
      def remote_fields_retrieve(common_models: nil, include_example_values: nil, request_options: nil)
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
              "common_models": common_models,
              "include_example_values": include_example_values
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/remote-fields"
          end
          Merge::Ats::RemoteFieldApiResponse.from_json(json_object: response.body)
        end
      end

      # Get all organization-wide Target Fields, this will not include any Linked
      #  Account specific Target Fields. Organization-wide Target Fields are additional
      #  fields appended to the Merge Common Model for all Linked Accounts in a category.
      #  [Learn
      #  more](https://docs.merge.dev/supplemental-data/field-mappings/target-fields/).
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::ExternalTargetFieldApiResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.field_mapping.target_fields_retrieve
      def target_fields_retrieve(request_options: nil)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/target-fields"
          end
          Merge::Ats::ExternalTargetFieldApiResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
