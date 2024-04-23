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
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Ats::ActivitiesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Activity` objects.
      #
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
      # @param remote_fields [Merge::Ats::Activities::ActivitiesListRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [Merge::Ats::Activities::ActivitiesListRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param user_id [String] If provided, will only return activities done by this user.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::PaginatedActivityList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.list
      def list(created_after: nil, created_before: nil, cursor: nil, expand: nil, include_deleted_data: nil,
               include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, user_id: nil, request_options: nil)
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
            "remote_fields": remote_fields,
            "remote_id": remote_id,
            "show_enum_origins": show_enum_origins,
            "user_id": user_id
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/activities"
        end
        Merge::Ats::PaginatedActivityList.from_json(json_object: response.body)
      end

      # Creates an `Activity` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Ats::ActivityRequest, as a Hash
      #   * :user (Hash)
      #   * :activity_type (Merge::Ats::ActivityTypeEnum)
      #   * :subject (String)
      #   * :body (String)
      #   * :visibility (Merge::Ats::VisibilityEnum)
      #   * :candidate (String)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param remote_user_id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::ActivityResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.create(model: {  }, remote_user_id: "remote_user_id")
      def create(model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
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
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            model: model,
            remote_user_id: remote_user_id
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/activities"
        end
        Merge::Ats::ActivityResponse.from_json(json_object: response.body)
      end

      # Returns an `Activity` object with the given `id`.
      #
      # @param id [String]
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param remote_fields [Merge::Ats::Activities::ActivitiesRetrieveRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [Merge::Ats::Activities::ActivitiesRetrieveRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::Activity]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, remote_fields: nil, show_enum_origins: nil,
                   request_options: nil)
        response = @request_client.conn.get do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/activities/#{id}"
        end
        Merge::Ats::Activity.from_json(json_object: response.body)
      end

      # Returns metadata for `Activity` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.meta_post_retrieve
      def meta_post_retrieve(request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/activities/meta/post"
        end
        Merge::Ats::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncActivitiesClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Ats::AsyncActivitiesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Activity` objects.
      #
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
      # @param remote_fields [Merge::Ats::Activities::ActivitiesListRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [Merge::Ats::Activities::ActivitiesListRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param user_id [String] If provided, will only return activities done by this user.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::PaginatedActivityList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.list
      def list(created_after: nil, created_before: nil, cursor: nil, expand: nil, include_deleted_data: nil,
               include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, user_id: nil, request_options: nil)
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
              "remote_fields": remote_fields,
              "remote_id": remote_id,
              "show_enum_origins": show_enum_origins,
              "user_id": user_id
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/activities"
          end
          Merge::Ats::PaginatedActivityList.from_json(json_object: response.body)
        end
      end

      # Creates an `Activity` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Ats::ActivityRequest, as a Hash
      #   * :user (Hash)
      #   * :activity_type (Merge::Ats::ActivityTypeEnum)
      #   * :subject (String)
      #   * :body (String)
      #   * :visibility (Merge::Ats::VisibilityEnum)
      #   * :candidate (String)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param remote_user_id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::ActivityResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.create(model: {  }, remote_user_id: "remote_user_id")
      def create(model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
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
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              model: model,
              remote_user_id: remote_user_id
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/activities"
          end
          Merge::Ats::ActivityResponse.from_json(json_object: response.body)
        end
      end

      # Returns an `Activity` object with the given `id`.
      #
      # @param id [String]
      # @param expand [String] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param remote_fields [Merge::Ats::Activities::ActivitiesRetrieveRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [Merge::Ats::Activities::ActivitiesRetrieveRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::Activity]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, remote_fields: nil, show_enum_origins: nil,
                   request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
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
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/activities/#{id}"
          end
          Merge::Ats::Activity.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Activity` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.meta_post_retrieve
      def meta_post_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/activities/meta/post"
          end
          Merge::Ats::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
