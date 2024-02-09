# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/comments_list_request_expand"
require_relative "../types/paginated_comment_list"
require_relative "../types/comment_request"
require_relative "../types/comment_response"
require_relative "types/comments_retrieve_request_expand"
require_relative "../types/comment"
require_relative "../types/meta_response"
require "async"

module Merge
  module Ticketing
    class CommentsClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Ticketing::CommentsClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `Comment` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [COMMENTS_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_created_after [DateTime] If provided, will only return Comments created in the third party platform after this datetime.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param ticket_id [String] If provided, will only return comments for this ticket.
      # @param request_options [RequestOptions]
      # @return [Ticketing::PaginatedCommentList]
      def list(created_after: nil, created_before: nil, cursor: nil, expand: nil, include_deleted_data: nil,
               include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_created_after: nil, remote_id: nil, ticket_id: nil, request_options: nil)
        response = @request_client.conn.get("/api/ticketing/v1/comments") do |req|
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
            "remote_created_after": remote_created_after,
            "remote_id": remote_id,
            "ticket_id": ticket_id
          }.compact
        end
        Ticketing::PaginatedCommentList.from_json(json_object: response.body)
      end

      # Creates a `Comment` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Ticketing::CommentRequest, as a Hash
      #   * :user (Hash)
      #   * :contact (Hash)
      #   * :body (String)
      #   * :html_body (String)
      #   * :ticket (Hash)
      #   * :is_private (Boolean)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param request_options [RequestOptions]
      # @return [Ticketing::CommentResponse]
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.post("/api/ticketing/v1/comments") do |req|
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
        Ticketing::CommentResponse.from_json(json_object: response.body)
      end

      # Returns a `Comment` object with the given `id`.
      #
      # @param id [String]
      # @param expand [COMMENTS_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Ticketing::Comment]
      def retrieve(id:, expand: nil, include_remote_data: nil, request_options: nil)
        response = @request_client.conn.get("/api/ticketing/v1/comments/#{id}") do |req|
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
        Ticketing::Comment.from_json(json_object: response.body)
      end

      # Returns metadata for `Comment` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Ticketing::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        response = @request_client.conn.get("/api/ticketing/v1/comments/meta/post") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Ticketing::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncCommentsClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Ticketing::AsyncCommentsClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `Comment` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [COMMENTS_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_created_after [DateTime] If provided, will only return Comments created in the third party platform after this datetime.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param ticket_id [String] If provided, will only return comments for this ticket.
      # @param request_options [RequestOptions]
      # @return [Ticketing::PaginatedCommentList]
      def list(created_after: nil, created_before: nil, cursor: nil, expand: nil, include_deleted_data: nil,
               include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_created_after: nil, remote_id: nil, ticket_id: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ticketing/v1/comments") do |req|
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
              "remote_created_after": remote_created_after,
              "remote_id": remote_id,
              "ticket_id": ticket_id
            }.compact
          end
          Ticketing::PaginatedCommentList.from_json(json_object: response.body)
        end
      end

      # Creates a `Comment` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Ticketing::CommentRequest, as a Hash
      #   * :user (Hash)
      #   * :contact (Hash)
      #   * :body (String)
      #   * :html_body (String)
      #   * :ticket (Hash)
      #   * :is_private (Boolean)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param request_options [RequestOptions]
      # @return [Ticketing::CommentResponse]
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/ticketing/v1/comments") do |req|
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
          Ticketing::CommentResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `Comment` object with the given `id`.
      #
      # @param id [String]
      # @param expand [COMMENTS_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Ticketing::Comment]
      def retrieve(id:, expand: nil, include_remote_data: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ticketing/v1/comments/#{id}") do |req|
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
          Ticketing::Comment.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Comment` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Ticketing::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ticketing/v1/comments/meta/post") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Ticketing::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
