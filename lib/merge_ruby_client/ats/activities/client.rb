# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/activities_list_request_remote_fields"
require_relative "types/activities_list_request_show_enum_origins"
require_relative "../types/paginated_activity_list"
require_relative "../types/activity_request"
require_relative "../types/activity_response"
require_relative "types/activities_retrieve_request_remote_fields"
require_relative "types/activities_retrieve_request_show_enum_origins"
require_relative "../types/activity"
require_relative "../types/meta_response"
require "async"

module Merge
  module Ats
    class ActivitiesClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Ats::ActivitiesClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `Activity` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [ACTIVITIES_LIST_REQUEST_REMOTE_FIELDS] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [ACTIVITIES_LIST_REQUEST_SHOW_ENUM_ORIGINS] Which fields should be returned in non-normalized form.
      # @param user_id [String] If provided, will only return activities done by this user.
      # @param request_options [RequestOptions]
      # @return [Ats::PaginatedActivityList]
      def list(created_after: nil, created_before: nil, cursor: nil, expand: nil, include_deleted_data: nil,
               include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, user_id: nil, request_options: nil)
        response = @request_client.conn.get("/api/ats/v1/activities") do |req|
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
            "remote_fields": remote_fields,
            "remote_id": remote_id,
            "show_enum_origins": show_enum_origins,
            "user_id": user_id
          }.compact
        end
        Ats::PaginatedActivityList.from_json(json_object: response.body)
      end

      # Creates an `Activity` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Ats::ActivityRequest, as a Hash
      #   * :user (Hash)
      #   * :activity_type (Hash)
      #   * :subject (String)
      #   * :body (String)
      #   * :visibility (Hash)
      #   * :candidate (String)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param remote_user_id [String]
      # @param request_options [RequestOptions]
      # @return [Ats::ActivityResponse]
      def create(model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.post("/api/ats/v1/activities") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "is_debug_mode": is_debug_mode,
            "run_async": run_async
          }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            model: model,
            remote_user_id: remote_user_id
          }.compact
        end
        Ats::ActivityResponse.from_json(json_object: response.body)
      end

      # Returns an `Activity` object with the given `id`.
      #
      # @param id [String]
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param remote_fields [ACTIVITIES_RETRIEVE_REQUEST_REMOTE_FIELDS] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [ACTIVITIES_RETRIEVE_REQUEST_SHOW_ENUM_ORIGINS] Which fields should be returned in non-normalized form.
      # @param request_options [RequestOptions]
      # @return [Ats::Activity]
      def retrieve(id:, expand: nil, include_remote_data: nil, remote_fields: nil, show_enum_origins: nil,
                   request_options: nil)
        response = @request_client.conn.get("/api/ats/v1/activities/#{id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "expand": expand,
            "include_remote_data": include_remote_data,
            "remote_fields": remote_fields,
            "show_enum_origins": show_enum_origins
          }.compact
        end
        Ats::Activity.from_json(json_object: response.body)
      end

      # Returns metadata for `Activity` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Ats::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        response = @request_client.conn.get("/api/ats/v1/activities/meta/post") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Ats::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncActivitiesClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Ats::AsyncActivitiesClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `Activity` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [ACTIVITIES_LIST_REQUEST_REMOTE_FIELDS] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [ACTIVITIES_LIST_REQUEST_SHOW_ENUM_ORIGINS] Which fields should be returned in non-normalized form.
      # @param user_id [String] If provided, will only return activities done by this user.
      # @param request_options [RequestOptions]
      # @return [Ats::PaginatedActivityList]
      def list(created_after: nil, created_before: nil, cursor: nil, expand: nil, include_deleted_data: nil,
               include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, user_id: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ats/v1/activities") do |req|
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
              "remote_fields": remote_fields,
              "remote_id": remote_id,
              "show_enum_origins": show_enum_origins,
              "user_id": user_id
            }.compact
          end
          Ats::PaginatedActivityList.from_json(json_object: response.body)
        end
      end

      # Creates an `Activity` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Ats::ActivityRequest, as a Hash
      #   * :user (Hash)
      #   * :activity_type (Hash)
      #   * :subject (String)
      #   * :body (String)
      #   * :visibility (Hash)
      #   * :candidate (String)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param remote_user_id [String]
      # @param request_options [RequestOptions]
      # @return [Ats::ActivityResponse]
      def create(model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/ats/v1/activities") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "is_debug_mode": is_debug_mode,
              "run_async": run_async
            }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              model: model,
              remote_user_id: remote_user_id
            }.compact
          end
          Ats::ActivityResponse.from_json(json_object: response.body)
        end
      end

      # Returns an `Activity` object with the given `id`.
      #
      # @param id [String]
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param remote_fields [ACTIVITIES_RETRIEVE_REQUEST_REMOTE_FIELDS] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [ACTIVITIES_RETRIEVE_REQUEST_SHOW_ENUM_ORIGINS] Which fields should be returned in non-normalized form.
      # @param request_options [RequestOptions]
      # @return [Ats::Activity]
      def retrieve(id:, expand: nil, include_remote_data: nil, remote_fields: nil, show_enum_origins: nil,
                   request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ats/v1/activities/#{id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "expand": expand,
              "include_remote_data": include_remote_data,
              "remote_fields": remote_fields,
              "show_enum_origins": show_enum_origins
            }.compact
          end
          Ats::Activity.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Activity` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Ats::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ats/v1/activities/meta/post") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Ats::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
