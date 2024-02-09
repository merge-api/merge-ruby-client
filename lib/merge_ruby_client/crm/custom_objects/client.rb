# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "../types/paginated_custom_object_list"
require_relative "../types/custom_object_request"
require_relative "../types/crm_custom_object_response"
require_relative "../types/custom_object"
require_relative "../types/meta_response"
require "async"

module Merge
  module Crm
    class CustomObjectsClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Crm::CustomObjectsClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `CustomObject` objects.
      #
      # @param custom_object_class_id [String]
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_options [RequestOptions]
      # @return [Crm::PaginatedCustomObjectList]
      def custom_object_classes_custom_objects_list(custom_object_class_id:, created_after: nil, created_before: nil,
                                                    cursor: nil, include_deleted_data: nil, include_remote_data: nil, include_remote_fields: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/custom-objects") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_remote_fields": include_remote_fields,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "page_size": page_size,
            "remote_id": remote_id
          }.compact
        end
        Crm::PaginatedCustomObjectList.from_json(json_object: response.body)
      end

      # Creates a `CustomObject` object with the given values.
      #
      # @param custom_object_class_id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Crm::CustomObjectRequest, as a Hash
      #   * :fields (Hash{String => String})
      # @param request_options [RequestOptions]
      # @return [Crm::CrmCustomObjectResponse]
      def custom_object_classes_custom_objects_create(custom_object_class_id:, model:, is_debug_mode: nil,
                                                      run_async: nil, request_options: nil)
        response = @request_client.conn.post("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/custom-objects") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "is_debug_mode": is_debug_mode,
            "run_async": run_async
          }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), model: model }.compact
        end
        Crm::CrmCustomObjectResponse.from_json(json_object: response.body)
      end

      # Returns a `CustomObject` object with the given `id`.
      #
      # @param custom_object_class_id [String]
      # @param id [String]
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param request_options [RequestOptions]
      # @return [Crm::CustomObject]
      def custom_object_classes_custom_objects_retrieve(custom_object_class_id:, id:, include_remote_data: nil,
                                                        include_remote_fields: nil, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/custom-objects/#{id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "include_remote_data": include_remote_data,
            "include_remote_fields": include_remote_fields
          }.compact
        end
        Crm::CustomObject.from_json(json_object: response.body)
      end

      # Returns metadata for `CRMCustomObject` PATCHs.
      #
      # @param custom_object_class_id [String]
      # @param id [String]
      # @param request_options [RequestOptions]
      # @return [Crm::MetaResponse]
      def custom_object_classes_custom_objects_meta_patch_retrieve(custom_object_class_id:, id:, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/custom-objects/meta/patch/#{id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Crm::MetaResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `CRMCustomObject` POSTs.
      #
      # @param custom_object_class_id [String]
      # @param request_options [RequestOptions]
      # @return [Crm::MetaResponse]
      def custom_object_classes_custom_objects_meta_post_retrieve(custom_object_class_id:, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/custom-objects/meta/post") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Crm::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncCustomObjectsClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Crm::AsyncCustomObjectsClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `CustomObject` objects.
      #
      # @param custom_object_class_id [String]
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_options [RequestOptions]
      # @return [Crm::PaginatedCustomObjectList]
      def custom_object_classes_custom_objects_list(custom_object_class_id:, created_after: nil, created_before: nil,
                                                    cursor: nil, include_deleted_data: nil, include_remote_data: nil, include_remote_fields: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/custom-objects") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_remote_fields": include_remote_fields,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "page_size": page_size,
              "remote_id": remote_id
            }.compact
          end
          Crm::PaginatedCustomObjectList.from_json(json_object: response.body)
        end
      end

      # Creates a `CustomObject` object with the given values.
      #
      # @param custom_object_class_id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Crm::CustomObjectRequest, as a Hash
      #   * :fields (Hash{String => String})
      # @param request_options [RequestOptions]
      # @return [Crm::CrmCustomObjectResponse]
      def custom_object_classes_custom_objects_create(custom_object_class_id:, model:, is_debug_mode: nil,
                                                      run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/custom-objects") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "is_debug_mode": is_debug_mode,
              "run_async": run_async
            }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), model: model }.compact
          end
          Crm::CrmCustomObjectResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `CustomObject` object with the given `id`.
      #
      # @param custom_object_class_id [String]
      # @param id [String]
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param request_options [RequestOptions]
      # @return [Crm::CustomObject]
      def custom_object_classes_custom_objects_retrieve(custom_object_class_id:, id:, include_remote_data: nil,
                                                        include_remote_fields: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/custom-objects/#{id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "include_remote_data": include_remote_data,
              "include_remote_fields": include_remote_fields
            }.compact
          end
          Crm::CustomObject.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `CRMCustomObject` PATCHs.
      #
      # @param custom_object_class_id [String]
      # @param id [String]
      # @param request_options [RequestOptions]
      # @return [Crm::MetaResponse]
      def custom_object_classes_custom_objects_meta_patch_retrieve(custom_object_class_id:, id:, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/custom-objects/meta/patch/#{id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Crm::MetaResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `CRMCustomObject` POSTs.
      #
      # @param custom_object_class_id [String]
      # @param request_options [RequestOptions]
      # @return [Crm::MetaResponse]
      def custom_object_classes_custom_objects_meta_post_retrieve(custom_object_class_id:, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/custom-objects/meta/post") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Crm::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
