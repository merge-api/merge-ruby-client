# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "../types/paginated_drive_list"
require_relative "../types/drive"
require "async"

module Merge
  module Filestorage
    class DrivesClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Filestorage::DrivesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Drive` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param name [String] If provided, will only return drives with this name. This performs an exact
      #  match.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::PaginatedDriveList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.list
      def list(created_after: nil, created_before: nil, cursor: nil, include_deleted_data: nil,
               include_remote_data: nil, modified_after: nil, modified_before: nil, name: nil, page_size: nil, remote_id: nil, request_options: nil)
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
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "name": name,
            "page_size": page_size,
            "remote_id": remote_id
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/drives"
        end
        Merge::Filestorage::PaginatedDriveList.from_json(json_object: response.body)
      end

      # Returns a `Drive` object with the given `id`.
      #
      # @param id [String]
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::Drive]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.retrieve(id: "id")
      def retrieve(id:, include_remote_data: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "include_remote_data": include_remote_data
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/drives/#{id}"
        end
        Merge::Filestorage::Drive.from_json(json_object: response.body)
      end
    end

    class AsyncDrivesClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Filestorage::AsyncDrivesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Drive` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param name [String] If provided, will only return drives with this name. This performs an exact
      #  match.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::PaginatedDriveList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.list
      def list(created_after: nil, created_before: nil, cursor: nil, include_deleted_data: nil,
               include_remote_data: nil, modified_after: nil, modified_before: nil, name: nil, page_size: nil, remote_id: nil, request_options: nil)
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
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "name": name,
              "page_size": page_size,
              "remote_id": remote_id
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/drives"
          end
          Merge::Filestorage::PaginatedDriveList.from_json(json_object: response.body)
        end
      end

      # Returns a `Drive` object with the given `id`.
      #
      # @param id [String]
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::Drive]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.retrieve(id: "id")
      def retrieve(id:, include_remote_data: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "include_remote_data": include_remote_data
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/drives/#{id}"
          end
          Merge::Filestorage::Drive.from_json(json_object: response.body)
        end
      end
    end
  end
end
