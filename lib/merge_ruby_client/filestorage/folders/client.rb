# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/folders_list_request_expand"
require_relative "../types/paginated_folder_list"
require_relative "../types/folder_request"
require_relative "../types/file_storage_folder_response"
require_relative "types/folders_retrieve_request_expand"
require_relative "../types/folder"
require_relative "../types/meta_response"
require "async"

module Merge
  module Filestorage
    class FoldersClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Filestorage::FoldersClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `Folder` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param drive_id [String] If provided, will only return folders in this drive.
      # @param expand [FOLDERS_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param name [String] If provided, will only return folders with this name. This performs an exact match.
      # @param page_size [Integer] Number of results to return per page.
      # @param parent_folder_id [String] If provided, will only return folders in this parent folder. If null, will return folders in root directory.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_options [RequestOptions]
      # @return [Filestorage::PaginatedFolderList]
      def list(created_after: nil, created_before: nil, cursor: nil, drive_id: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, name: nil, page_size: nil, parent_folder_id: nil, remote_id: nil, request_options: nil)
        response = @request_client.conn.get("/api/filestorage/v1/folders") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "drive_id": drive_id,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "name": name,
            "page_size": page_size,
            "parent_folder_id": parent_folder_id,
            "remote_id": remote_id
          }.compact
        end
        Filestorage::PaginatedFolderList.from_json(json_object: response.body)
      end

      # Creates a `Folder` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Filestorage::FolderRequest, as a Hash
      #   * :name (String)
      #   * :folder_url (String)
      #   * :size (Integer)
      #   * :description (String)
      #   * :parent_folder (Hash)
      #   * :drive (Hash)
      #   * :permissions (Hash)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param request_options [RequestOptions]
      # @return [Filestorage::FileStorageFolderResponse]
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.post("/api/filestorage/v1/folders") do |req|
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
        Filestorage::FileStorageFolderResponse.from_json(json_object: response.body)
      end

      # Returns a `Folder` object with the given `id`.
      #
      # @param id [String]
      # @param expand [FOLDERS_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Filestorage::Folder]
      def retrieve(id:, expand: nil, include_remote_data: nil, request_options: nil)
        response = @request_client.conn.get("/api/filestorage/v1/folders/#{id}") do |req|
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
        Filestorage::Folder.from_json(json_object: response.body)
      end

      # Returns metadata for `FileStorageFolder` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Filestorage::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        response = @request_client.conn.get("/api/filestorage/v1/folders/meta/post") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Filestorage::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncFoldersClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Filestorage::AsyncFoldersClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `Folder` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param drive_id [String] If provided, will only return folders in this drive.
      # @param expand [FOLDERS_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param name [String] If provided, will only return folders with this name. This performs an exact match.
      # @param page_size [Integer] Number of results to return per page.
      # @param parent_folder_id [String] If provided, will only return folders in this parent folder. If null, will return folders in root directory.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_options [RequestOptions]
      # @return [Filestorage::PaginatedFolderList]
      def list(created_after: nil, created_before: nil, cursor: nil, drive_id: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, name: nil, page_size: nil, parent_folder_id: nil, remote_id: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/filestorage/v1/folders") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "drive_id": drive_id,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "name": name,
              "page_size": page_size,
              "parent_folder_id": parent_folder_id,
              "remote_id": remote_id
            }.compact
          end
          Filestorage::PaginatedFolderList.from_json(json_object: response.body)
        end
      end

      # Creates a `Folder` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Filestorage::FolderRequest, as a Hash
      #   * :name (String)
      #   * :folder_url (String)
      #   * :size (Integer)
      #   * :description (String)
      #   * :parent_folder (Hash)
      #   * :drive (Hash)
      #   * :permissions (Hash)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param request_options [RequestOptions]
      # @return [Filestorage::FileStorageFolderResponse]
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/filestorage/v1/folders") do |req|
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
          Filestorage::FileStorageFolderResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `Folder` object with the given `id`.
      #
      # @param id [String]
      # @param expand [FOLDERS_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Filestorage::Folder]
      def retrieve(id:, expand: nil, include_remote_data: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/filestorage/v1/folders/#{id}") do |req|
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
          Filestorage::Folder.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `FileStorageFolder` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Filestorage::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get("/api/filestorage/v1/folders/meta/post") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Filestorage::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
