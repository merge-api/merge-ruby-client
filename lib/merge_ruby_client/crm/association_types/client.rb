# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "../types/paginated_association_type_list"
require_relative "../types/association_type_request_request"
require_relative "../types/crm_association_type_response"
require_relative "../types/association_type"
require_relative "../types/meta_response"
require "async"

module Merge
  module Crm
    class AssociationTypesClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Crm::AssociationTypesClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `AssociationType` objects.
      #
      # @param custom_object_class_id [String]
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_options [RequestOptions]
      # @return [Crm::PaginatedAssociationTypeList]
      def custom_object_classes_association_types_list(custom_object_class_id:, created_after: nil,
                                                       created_before: nil, cursor: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/association-types") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "page_size": page_size,
            "remote_id": remote_id
          }.compact
        end
        Crm::PaginatedAssociationTypeList.from_json(json_object: response.body)
      end

      # Creates an `AssociationType` object with the given values.
      #
      # @param custom_object_class_id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Crm::AssociationTypeRequestRequest, as a Hash
      #   * :source_object_class (Hash)
      #     * :id (String)
      #     * :origin_type (ORIGIN_TYPE_ENUM)
      #   * :target_object_classes (Array<Crm::ObjectClassDescriptionRequest>)
      #   * :remote_key_name (String)
      #   * :display_name (String)
      #   * :cardinality (CARDINALITY_ENUM)
      #   * :is_required (Boolean)
      # @param request_options [RequestOptions]
      # @return [Crm::CrmAssociationTypeResponse]
      def custom_object_classes_association_types_create(custom_object_class_id:, model:, is_debug_mode: nil,
                                                         run_async: nil, request_options: nil)
        response = @request_client.conn.post("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/association-types") do |req|
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
        Crm::CrmAssociationTypeResponse.from_json(json_object: response.body)
      end

      # Returns an `AssociationType` object with the given `id`.
      #
      # @param custom_object_class_id [String]
      # @param id [String]
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Crm::AssociationType]
      def custom_object_classes_association_types_retrieve(custom_object_class_id:, id:, expand: nil,
                                                           include_remote_data: nil, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/association-types/#{id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "expand": expand,
            "include_remote_data": include_remote_data
          }.compact
        end
        Crm::AssociationType.from_json(json_object: response.body)
      end

      # Returns metadata for `CRMAssociationType` POSTs.
      #
      # @param custom_object_class_id [String]
      # @param request_options [RequestOptions]
      # @return [Crm::MetaResponse]
      def custom_object_classes_association_types_meta_post_retrieve(custom_object_class_id:, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/association-types/meta/post") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Crm::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncAssociationTypesClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Crm::AsyncAssociationTypesClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `AssociationType` objects.
      #
      # @param custom_object_class_id [String]
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_options [RequestOptions]
      # @return [Crm::PaginatedAssociationTypeList]
      def custom_object_classes_association_types_list(custom_object_class_id:, created_after: nil,
                                                       created_before: nil, cursor: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/association-types") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "page_size": page_size,
              "remote_id": remote_id
            }.compact
          end
          Crm::PaginatedAssociationTypeList.from_json(json_object: response.body)
        end
      end

      # Creates an `AssociationType` object with the given values.
      #
      # @param custom_object_class_id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Crm::AssociationTypeRequestRequest, as a Hash
      #   * :source_object_class (Hash)
      #     * :id (String)
      #     * :origin_type (ORIGIN_TYPE_ENUM)
      #   * :target_object_classes (Array<Crm::ObjectClassDescriptionRequest>)
      #   * :remote_key_name (String)
      #   * :display_name (String)
      #   * :cardinality (CARDINALITY_ENUM)
      #   * :is_required (Boolean)
      # @param request_options [RequestOptions]
      # @return [Crm::CrmAssociationTypeResponse]
      def custom_object_classes_association_types_create(custom_object_class_id:, model:, is_debug_mode: nil,
                                                         run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/association-types") do |req|
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
          Crm::CrmAssociationTypeResponse.from_json(json_object: response.body)
        end
      end

      # Returns an `AssociationType` object with the given `id`.
      #
      # @param custom_object_class_id [String]
      # @param id [String]
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Crm::AssociationType]
      def custom_object_classes_association_types_retrieve(custom_object_class_id:, id:, expand: nil,
                                                           include_remote_data: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/association-types/#{id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "expand": expand,
              "include_remote_data": include_remote_data
            }.compact
          end
          Crm::AssociationType.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `CRMAssociationType` POSTs.
      #
      # @param custom_object_class_id [String]
      # @param request_options [RequestOptions]
      # @return [Crm::MetaResponse]
      def custom_object_classes_association_types_meta_post_retrieve(custom_object_class_id:, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/custom-object-classes/#{custom_object_class_id}/association-types/meta/post") do |req|
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
