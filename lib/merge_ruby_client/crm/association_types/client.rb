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
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Crm::AssociationTypesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `AssociationType` objects.
      #
      # @param custom_object_class_id [String]
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::PaginatedAssociationTypeList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.custom_object_classes_association_types_list(custom_object_class_id: "custom_object_class_id")
      def custom_object_classes_association_types_list(custom_object_class_id:, created_after: nil,
                                                       created_before: nil, cursor: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, request_options: nil)
        response = @request_client.conn.get do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/custom-object-classes/#{custom_object_class_id}/association-types"
        end
        Merge::Crm::PaginatedAssociationTypeList.from_json(json_object: response.body)
      end

      # Creates an `AssociationType` object with the given values.
      #
      # @param custom_object_class_id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Crm::AssociationTypeRequestRequest, as a Hash
      #   * :source_object_class (Hash)
      #     * :id (String)
      #     * :origin_type (Merge::Crm::OriginTypeEnum)
      #   * :target_object_classes (Array<Merge::Crm::ObjectClassDescriptionRequest>)
      #   * :remote_key_name (String)
      #   * :display_name (String)
      #   * :cardinality (Merge::Crm::CardinalityEnum)
      #   * :is_required (Boolean)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::CrmAssociationTypeResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.custom_object_classes_association_types_create(custom_object_class_id: "custom_object_class_id", model: { source_object_class: { id: "id", origin_type: CUSTOM_OBJECT }, target_object_classes: [{ id: "id", origin_type: CUSTOM_OBJECT }], remote_key_name: "remote_key_name" })
      def custom_object_classes_association_types_create(custom_object_class_id:, model:, is_debug_mode: nil,
                                                         run_async: nil, request_options: nil)
        response = @request_client.conn.post do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/custom-object-classes/#{custom_object_class_id}/association-types"
        end
        Merge::Crm::CrmAssociationTypeResponse.from_json(json_object: response.body)
      end

      # Returns an `AssociationType` object with the given `id`.
      #
      # @param custom_object_class_id [String]
      # @param id [String]
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::AssociationType]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.custom_object_classes_association_types_retrieve(custom_object_class_id: "custom_object_class_id", id: "id")
      def custom_object_classes_association_types_retrieve(custom_object_class_id:, id:, expand: nil,
                                                           include_remote_data: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "expand": expand,
            "include_remote_data": include_remote_data
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/custom-object-classes/#{custom_object_class_id}/association-types/#{id}"
        end
        Merge::Crm::AssociationType.from_json(json_object: response.body)
      end

      # Returns metadata for `CRMAssociationType` POSTs.
      #
      # @param custom_object_class_id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.custom_object_classes_association_types_meta_post_retrieve(custom_object_class_id: "custom_object_class_id")
      def custom_object_classes_association_types_meta_post_retrieve(custom_object_class_id:, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/custom-object-classes/#{custom_object_class_id}/association-types/meta/post"
        end
        Merge::Crm::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncAssociationTypesClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Crm::AsyncAssociationTypesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `AssociationType` objects.
      #
      # @param custom_object_class_id [String]
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::PaginatedAssociationTypeList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.custom_object_classes_association_types_list(custom_object_class_id: "custom_object_class_id")
      def custom_object_classes_association_types_list(custom_object_class_id:, created_after: nil,
                                                       created_before: nil, cursor: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
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
            req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/custom-object-classes/#{custom_object_class_id}/association-types"
          end
          Merge::Crm::PaginatedAssociationTypeList.from_json(json_object: response.body)
        end
      end

      # Creates an `AssociationType` object with the given values.
      #
      # @param custom_object_class_id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Crm::AssociationTypeRequestRequest, as a Hash
      #   * :source_object_class (Hash)
      #     * :id (String)
      #     * :origin_type (Merge::Crm::OriginTypeEnum)
      #   * :target_object_classes (Array<Merge::Crm::ObjectClassDescriptionRequest>)
      #   * :remote_key_name (String)
      #   * :display_name (String)
      #   * :cardinality (Merge::Crm::CardinalityEnum)
      #   * :is_required (Boolean)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::CrmAssociationTypeResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.custom_object_classes_association_types_create(custom_object_class_id: "custom_object_class_id", model: { source_object_class: { id: "id", origin_type: CUSTOM_OBJECT }, target_object_classes: [{ id: "id", origin_type: CUSTOM_OBJECT }], remote_key_name: "remote_key_name" })
      def custom_object_classes_association_types_create(custom_object_class_id:, model:, is_debug_mode: nil,
                                                         run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
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
            req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/custom-object-classes/#{custom_object_class_id}/association-types"
          end
          Merge::Crm::CrmAssociationTypeResponse.from_json(json_object: response.body)
        end
      end

      # Returns an `AssociationType` object with the given `id`.
      #
      # @param custom_object_class_id [String]
      # @param id [String]
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::AssociationType]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.custom_object_classes_association_types_retrieve(custom_object_class_id: "custom_object_class_id", id: "id")
      def custom_object_classes_association_types_retrieve(custom_object_class_id:, id:, expand: nil,
                                                           include_remote_data: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "expand": expand,
              "include_remote_data": include_remote_data
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/custom-object-classes/#{custom_object_class_id}/association-types/#{id}"
          end
          Merge::Crm::AssociationType.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `CRMAssociationType` POSTs.
      #
      # @param custom_object_class_id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.custom_object_classes_association_types_meta_post_retrieve(custom_object_class_id: "custom_object_class_id")
      def custom_object_classes_association_types_meta_post_retrieve(custom_object_class_id:, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/custom-object-classes/#{custom_object_class_id}/association-types/meta/post"
          end
          Merge::Crm::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
