# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/files_list_request_expand"
require_relative "../types/paginated_file_list"
require_relative "../types/file_request"
require_relative "../types/file_storage_file_response"
require_relative "types/files_retrieve_request_expand"
require_relative "../types/file"
require_relative "../types/meta_response"
require "async"

module Merge
  module Filestorage
    class FilesClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Filestorage::FilesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `File` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param drive_id [String] Specifying a drive id returns only the files in that drive. Specifying null
      #  returns only the files outside the top-level drive.
      # @param expand [Merge::Filestorage::Files::FilesListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param folder_id [String] Specifying a folder id returns only the files in that folder. Specifying null
      #  returns only the files in root directory.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param mime_type [String] If provided, will only return files with these mime_types. Multiple values can
      #  be separated by commas.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param name [String] If provided, will only return files with this name. This performs an exact
      #  match.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::PaginatedFileList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.files.list
      def list(created_after: nil, created_before: nil, cursor: nil, drive_id: nil, expand: nil, folder_id: nil,
               include_deleted_data: nil, include_remote_data: nil, include_shell_data: nil, mime_type: nil, modified_after: nil, modified_before: nil, name: nil, page_size: nil, remote_id: nil, request_options: nil)
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
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "drive_id": drive_id,
            "expand": expand,
            "folder_id": folder_id,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_shell_data": include_shell_data,
            "mime_type": mime_type,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "name": name,
            "page_size": page_size,
            "remote_id": remote_id
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/files"
        end
        Merge::Filestorage::PaginatedFileList.from_json(json_object: response.body)
      end

      # Creates a `File` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Filestorage::FileRequest, as a Hash
      #   * :name (String)
      #   * :file_url (String)
      #   * :file_thumbnail_url (String)
      #   * :size (Long)
      #   * :mime_type (String)
      #   * :description (String)
      #   * :folder (Hash)
      #   * :permissions (Hash)
      #   * :drive (Hash)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::FileStorageFileResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.files.create(model: {  })
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
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
            "is_debug_mode": is_debug_mode,
            "run_async": run_async
          }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), model: model }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/files"
        end
        Merge::Filestorage::FileStorageFileResponse.from_json(json_object: response.body)
      end

      # Returns a `File` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Filestorage::Files::FilesRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::File]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.files.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, request_options: nil)
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
            "expand": expand,
            "include_remote_data": include_remote_data
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/files/#{id}"
        end
        Merge::Filestorage::File.from_json(json_object: response.body)
      end

      # Returns the `File` content with the given `id` as a stream of bytes.
      #
      # @param id [String]
      # @param mime_type [String] If provided, specifies the export format of the file to be downloaded. For
      #  information on supported export formats, please refer to our <a
      #  tps://help.merge.dev/en/articles/8615316-file-export-and-download-specification'
      #  target='_blank'>export format help center article</a>.
      # @param request_options [Merge::RequestOptions]
      # @yield on_data[chunk, overall_received_bytes, env] Leverage the Faraday on_data callback which
      #  will receive tuples of strings, the sum of characters received so far, and the
      #  response environment. The latter will allow access to the response status,
      #  headers and reason, as well as the request info.
      # @return [Void]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.files.download_retrieve(id: "string", mime_type: "string")
      def download_retrieve(id:, mime_type: nil, request_options: nil, &on_data)
        @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.options.on_data = on_data
          req.params = { **(request_options&.additional_query_parameters || {}), "mime_type": mime_type }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/files/#{id}/download"
        end
      end

      # Returns metadata for `FileStorageFile` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.files.meta_post_retrieve
      def meta_post_retrieve(request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/files/meta/post"
        end
        Merge::Filestorage::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncFilesClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Filestorage::AsyncFilesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `File` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param drive_id [String] Specifying a drive id returns only the files in that drive. Specifying null
      #  returns only the files outside the top-level drive.
      # @param expand [Merge::Filestorage::Files::FilesListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param folder_id [String] Specifying a folder id returns only the files in that folder. Specifying null
      #  returns only the files in root directory.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param mime_type [String] If provided, will only return files with these mime_types. Multiple values can
      #  be separated by commas.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param name [String] If provided, will only return files with this name. This performs an exact
      #  match.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::PaginatedFileList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.files.list
      def list(created_after: nil, created_before: nil, cursor: nil, drive_id: nil, expand: nil, folder_id: nil,
               include_deleted_data: nil, include_remote_data: nil, include_shell_data: nil, mime_type: nil, modified_after: nil, modified_before: nil, name: nil, page_size: nil, remote_id: nil, request_options: nil)
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
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "drive_id": drive_id,
              "expand": expand,
              "folder_id": folder_id,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_shell_data": include_shell_data,
              "mime_type": mime_type,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "name": name,
              "page_size": page_size,
              "remote_id": remote_id
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/files"
          end
          Merge::Filestorage::PaginatedFileList.from_json(json_object: response.body)
        end
      end

      # Creates a `File` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Filestorage::FileRequest, as a Hash
      #   * :name (String)
      #   * :file_url (String)
      #   * :file_thumbnail_url (String)
      #   * :size (Long)
      #   * :mime_type (String)
      #   * :description (String)
      #   * :folder (Hash)
      #   * :permissions (Hash)
      #   * :drive (Hash)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::FileStorageFileResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.files.create(model: {  })
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
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
              "is_debug_mode": is_debug_mode,
              "run_async": run_async
            }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), model: model }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/files"
          end
          Merge::Filestorage::FileStorageFileResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `File` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Filestorage::Files::FilesRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::File]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.files.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, request_options: nil)
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
              "expand": expand,
              "include_remote_data": include_remote_data
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/files/#{id}"
          end
          Merge::Filestorage::File.from_json(json_object: response.body)
        end
      end

      # Returns the `File` content with the given `id` as a stream of bytes.
      #
      # @param id [String]
      # @param mime_type [String] If provided, specifies the export format of the file to be downloaded. For
      #  information on supported export formats, please refer to our <a
      #  tps://help.merge.dev/en/articles/8615316-file-export-and-download-specification'
      #  target='_blank'>export format help center article</a>.
      # @param request_options [Merge::RequestOptions]
      # @yield on_data[chunk, overall_received_bytes, env] Leverage the Faraday on_data callback which
      #  will receive tuples of strings, the sum of characters received so far, and the
      #  response environment. The latter will allow access to the response status,
      #  headers and reason, as well as the request info.
      # @return [Void]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.files.download_retrieve(id: "string", mime_type: "string")
      def download_retrieve(id:, mime_type: nil, request_options: nil, &on_data)
        Async do
          @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.options.on_data = on_data
            req.params = { **(request_options&.additional_query_parameters || {}), "mime_type": mime_type }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/files/#{id}/download"
          end
        end
      end

      # Returns metadata for `FileStorageFile` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Filestorage::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.filestorage.files.meta_post_retrieve
      def meta_post_retrieve(request_options: nil)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/filestorage/v1/files/meta/post"
          end
          Merge::Filestorage::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
