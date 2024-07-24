# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "../types/paginated_association_list"
require_relative "../types/association"
require "async"

module Merge
  module Crm
    class AssociationsClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Crm::AssociationsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Association` objects.
      #
      # @param custom_object_class_id [String]
      # @param object_id [String]
      # @param association_type_id [String] If provided, will only return opportunities with this association_type.
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
      # @return [Merge::Crm::PaginatedAssociationList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.associations.custom_object_classes_custom_objects_associations_list(custom_object_class_id: "custom_object_class_id", object_id: "object_id")
      def custom_object_classes_custom_objects_associations_list(custom_object_class_id:, object_id:,
                                                                 association_type_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, request_options: nil)
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
            "association_type_id": association_type_id,
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
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/custom-object-classes/#{custom_object_class_id}/custom-objects/#{object_id}/associations"
        end
        Merge::Crm::PaginatedAssociationList.from_json(json_object: response.body)
      end

      # Creates an Association between `source_object_id` and `target_object_id` of type
      #  `association_type_id`.
      #
      # @param association_type_id [String]
      # @param source_class_id [String]
      # @param source_object_id [String]
      # @param target_class_id [String]
      # @param target_object_id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::Association]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.associations.custom_object_classes_custom_objects_associations_update(
      #    association_type_id: "association_type_id",
      #    source_class_id: "source_class_id",
      #    source_object_id: "source_object_id",
      #    target_class_id: "target_class_id",
      #    target_object_id: "target_object_id"
      #  )
      def custom_object_classes_custom_objects_associations_update(association_type_id:, source_class_id:,
                                                                   source_object_id:, target_class_id:, target_object_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.put do |req|
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
            "is_debug_mode": is_debug_mode,
            "run_async": run_async
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/custom-object-classes/#{association_type_id}/custom-objects/#{source_class_id}/associations/#{source_object_id}/#{target_class_id}/#{target_object_id}"
        end
        Merge::Crm::Association.from_json(json_object: response.body)
      end
    end

    class AsyncAssociationsClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Crm::AsyncAssociationsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Association` objects.
      #
      # @param custom_object_class_id [String]
      # @param object_id [String]
      # @param association_type_id [String] If provided, will only return opportunities with this association_type.
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
      # @return [Merge::Crm::PaginatedAssociationList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.associations.custom_object_classes_custom_objects_associations_list(custom_object_class_id: "custom_object_class_id", object_id: "object_id")
      def custom_object_classes_custom_objects_associations_list(custom_object_class_id:, object_id:,
                                                                 association_type_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, request_options: nil)
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
              "association_type_id": association_type_id,
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
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/custom-object-classes/#{custom_object_class_id}/custom-objects/#{object_id}/associations"
          end
          Merge::Crm::PaginatedAssociationList.from_json(json_object: response.body)
        end
      end

      # Creates an Association between `source_object_id` and `target_object_id` of type
      #  `association_type_id`.
      #
      # @param association_type_id [String]
      # @param source_class_id [String]
      # @param source_object_id [String]
      # @param target_class_id [String]
      # @param target_object_id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::Association]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.associations.custom_object_classes_custom_objects_associations_update(
      #    association_type_id: "association_type_id",
      #    source_class_id: "source_class_id",
      #    source_object_id: "source_object_id",
      #    target_class_id: "target_class_id",
      #    target_object_id: "target_object_id"
      #  )
      def custom_object_classes_custom_objects_associations_update(association_type_id:, source_class_id:,
                                                                   source_object_id:, target_class_id:, target_object_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.put do |req|
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
              "is_debug_mode": is_debug_mode,
              "run_async": run_async
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/custom-object-classes/#{association_type_id}/custom-objects/#{source_class_id}/associations/#{source_object_id}/#{target_class_id}/#{target_object_id}"
          end
          Merge::Crm::Association.from_json(json_object: response.body)
        end
      end
    end
  end
end
