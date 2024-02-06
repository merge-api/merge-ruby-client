# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "../types/paginated_engagement_type_list"
require_relative "../types/engagement_type"
require_relative "../types/paginated_remote_field_class_list"
require "async"

module Merge
  module Crm
    class EngagementTypesClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Crm::EngagementTypesClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `EngagementType` objects.
      #
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
      # @return [Crm::PaginatedEngagementTypeList]
      def list(created_after: nil, created_before: nil, cursor: nil, include_deleted_data: nil,
               include_remote_data: nil, include_remote_fields: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/engagement-types") do |req|
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
        Crm::PaginatedEngagementTypeList.from_json(json_object: response.body)
      end

      # Returns an `EngagementType` object with the given `id`.
      #
      # @param id [String]
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param request_options [RequestOptions]
      # @return [Crm::EngagementType]
      def retrieve(id:, include_remote_data: nil, include_remote_fields: nil, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/engagement-types/#{id}") do |req|
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
        Crm::EngagementType.from_json(json_object: response.body)
      end

      # Returns a list of `RemoteFieldClass` objects.
      #
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [RequestOptions]
      # @return [Crm::PaginatedRemoteFieldClassList]
      def remote_field_classes_list(cursor: nil, include_deleted_data: nil, include_remote_data: nil,
                                    include_remote_fields: nil, page_size: nil, request_options: nil)
        response = @request_client.conn.get("/api/crm/v1/engagement-types/remote-field-classes") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "cursor": cursor,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_remote_fields": include_remote_fields,
            "page_size": page_size
          }.compact
        end
        Crm::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
      end
    end

    class AsyncEngagementTypesClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Crm::AsyncEngagementTypesClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `EngagementType` objects.
      #
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
      # @return [Crm::PaginatedEngagementTypeList]
      def list(created_after: nil, created_before: nil, cursor: nil, include_deleted_data: nil,
               include_remote_data: nil, include_remote_fields: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/engagement-types") do |req|
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
          Crm::PaginatedEngagementTypeList.from_json(json_object: response.body)
        end
      end

      # Returns an `EngagementType` object with the given `id`.
      #
      # @param id [String]
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param request_options [RequestOptions]
      # @return [Crm::EngagementType]
      def retrieve(id:, include_remote_data: nil, include_remote_fields: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/engagement-types/#{id}") do |req|
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
          Crm::EngagementType.from_json(json_object: response.body)
        end
      end

      # Returns a list of `RemoteFieldClass` objects.
      #
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to common models, in a normalized format.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [RequestOptions]
      # @return [Crm::PaginatedRemoteFieldClassList]
      def remote_field_classes_list(cursor: nil, include_deleted_data: nil, include_remote_data: nil,
                                    include_remote_fields: nil, page_size: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/crm/v1/engagement-types/remote-field-classes") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "cursor": cursor,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_remote_fields": include_remote_fields,
              "page_size": page_size
            }.compact
          end
          Crm::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
        end
      end
    end
  end
end
