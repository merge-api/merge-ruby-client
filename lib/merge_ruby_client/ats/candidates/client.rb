# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/candidates_list_request_expand"
require_relative "../types/paginated_candidate_list"
require_relative "../types/candidate_request"
require_relative "../types/candidate_response"
require_relative "types/candidates_retrieve_request_expand"
require_relative "../types/candidate"
require_relative "../types/patched_candidate_request"
require_relative "../types/reason_enum"
require_relative "../types/meta_response"
require "async"

module Merge
  module Ats
    class CandidatesClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Ats::CandidatesClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `Candidate` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param email_addresses [String] If provided, will only return candidates with these email addresses; multiple addresses can be separated by commas.
      # @param expand [CANDIDATES_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param first_name [String] If provided, will only return candidates with this first name.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param last_name [String] If provided, will only return candidates with this last name.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param tags [String] If provided, will only return candidates with these tags; multiple tags can be separated by commas.
      # @param request_options [RequestOptions]
      # @return [Ats::PaginatedCandidateList]
      def list(created_after: nil, created_before: nil, cursor: nil, email_addresses: nil, expand: nil,
               first_name: nil, include_deleted_data: nil, include_remote_data: nil, last_name: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, tags: nil, request_options: nil)
        response = @request_client.conn.get("/api/ats/v1/candidates") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "email_addresses": email_addresses,
            "expand": expand,
            "first_name": first_name,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "last_name": last_name,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "page_size": page_size,
            "remote_id": remote_id,
            "tags": tags
          }.compact
        end
        Ats::PaginatedCandidateList.from_json(json_object: response.body)
      end

      # Creates a `Candidate` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Ats::CandidateRequest, as a Hash
      #   * :first_name (String)
      #   * :last_name (String)
      #   * :company (String)
      #   * :title (String)
      #   * :last_interaction_at (DateTime)
      #   * :is_private (Boolean)
      #   * :can_email (Boolean)
      #   * :locations (Array<String>)
      #   * :phone_numbers (Array<Ats::PhoneNumberRequest>)
      #   * :email_addresses (Array<Ats::EmailAddressRequest>)
      #   * :urls (Array<Ats::UrlRequest>)
      #   * :tags (Array<String>)
      #   * :applications (Array<Ats::CandidateRequestApplicationsItem>)
      #   * :attachments (Array<Ats::CandidateRequestAttachmentsItem>)
      #   * :remote_template_id (String)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param remote_user_id [String]
      # @param request_options [RequestOptions]
      # @return [Ats::CandidateResponse]
      def create(model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.post("/api/ats/v1/candidates") do |req|
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
        Ats::CandidateResponse.from_json(json_object: response.body)
      end

      # Returns a `Candidate` object with the given `id`.
      #
      # @param id [String]
      # @param expand [CANDIDATES_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Ats::Candidate]
      def retrieve(id:, expand: nil, include_remote_data: nil, request_options: nil)
        response = @request_client.conn.get("/api/ats/v1/candidates/#{id}") do |req|
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
        Ats::Candidate.from_json(json_object: response.body)
      end

      # Updates a `Candidate` object with the given `id`.
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Ats::PatchedCandidateRequest, as a Hash
      #   * :first_name (String)
      #   * :last_name (String)
      #   * :company (String)
      #   * :title (String)
      #   * :last_interaction_at (DateTime)
      #   * :is_private (Boolean)
      #   * :can_email (Boolean)
      #   * :locations (Array<String>)
      #   * :phone_numbers (Array<Ats::PhoneNumberRequest>)
      #   * :email_addresses (Array<Ats::EmailAddressRequest>)
      #   * :urls (Array<Ats::UrlRequest>)
      #   * :tags (Array<String>)
      #   * :applications (Array<String>)
      #   * :attachments (Array<String>)
      #   * :remote_template_id (String)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param remote_user_id [String]
      # @param request_options [RequestOptions]
      # @return [Ats::CandidateResponse]
      def partial_update(id:, model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.patch("/api/ats/v1/candidates/#{id}") do |req|
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
        Ats::CandidateResponse.from_json(json_object: response.body)
      end

      # Ignores a specific row based on the `model_id` in the url. These records will have their properties set to null, and will not be updated in future syncs. The "reason" and "message" fields in the request body will be stored for audit purposes.
      #
      # @param model_id [String]
      # @param reason [REASON_ENUM]
      # @param message [String]
      # @param request_options [RequestOptions]
      # @return [Void]
      def ignore_create(model_id:, reason:, message: nil, request_options: nil)
        @request_client.conn.post("/api/ats/v1/candidates/ignore/#{model_id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), reason: reason, message: message }.compact
        end
      end

      # Returns metadata for `Candidate` PATCHs.
      #
      # @param id [String]
      # @param request_options [RequestOptions]
      # @return [Ats::MetaResponse]
      def meta_patch_retrieve(id:, request_options: nil)
        response = @request_client.conn.get("/api/ats/v1/candidates/meta/patch/#{id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Ats::MetaResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `Candidate` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Ats::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        response = @request_client.conn.get("/api/ats/v1/candidates/meta/post") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Ats::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncCandidatesClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Ats::AsyncCandidatesClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `Candidate` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param email_addresses [String] If provided, will only return candidates with these email addresses; multiple addresses can be separated by commas.
      # @param expand [CANDIDATES_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param first_name [String] If provided, will only return candidates with this first name.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param last_name [String] If provided, will only return candidates with this last name.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param tags [String] If provided, will only return candidates with these tags; multiple tags can be separated by commas.
      # @param request_options [RequestOptions]
      # @return [Ats::PaginatedCandidateList]
      def list(created_after: nil, created_before: nil, cursor: nil, email_addresses: nil, expand: nil,
               first_name: nil, include_deleted_data: nil, include_remote_data: nil, last_name: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, tags: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ats/v1/candidates") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "email_addresses": email_addresses,
              "expand": expand,
              "first_name": first_name,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "last_name": last_name,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "page_size": page_size,
              "remote_id": remote_id,
              "tags": tags
            }.compact
          end
          Ats::PaginatedCandidateList.from_json(json_object: response.body)
        end
      end

      # Creates a `Candidate` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Ats::CandidateRequest, as a Hash
      #   * :first_name (String)
      #   * :last_name (String)
      #   * :company (String)
      #   * :title (String)
      #   * :last_interaction_at (DateTime)
      #   * :is_private (Boolean)
      #   * :can_email (Boolean)
      #   * :locations (Array<String>)
      #   * :phone_numbers (Array<Ats::PhoneNumberRequest>)
      #   * :email_addresses (Array<Ats::EmailAddressRequest>)
      #   * :urls (Array<Ats::UrlRequest>)
      #   * :tags (Array<String>)
      #   * :applications (Array<Ats::CandidateRequestApplicationsItem>)
      #   * :attachments (Array<Ats::CandidateRequestAttachmentsItem>)
      #   * :remote_template_id (String)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param remote_user_id [String]
      # @param request_options [RequestOptions]
      # @return [Ats::CandidateResponse]
      def create(model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/ats/v1/candidates") do |req|
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
          Ats::CandidateResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `Candidate` object with the given `id`.
      #
      # @param id [String]
      # @param expand [CANDIDATES_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Ats::Candidate]
      def retrieve(id:, expand: nil, include_remote_data: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ats/v1/candidates/#{id}") do |req|
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
          Ats::Candidate.from_json(json_object: response.body)
        end
      end

      # Updates a `Candidate` object with the given `id`.
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Ats::PatchedCandidateRequest, as a Hash
      #   * :first_name (String)
      #   * :last_name (String)
      #   * :company (String)
      #   * :title (String)
      #   * :last_interaction_at (DateTime)
      #   * :is_private (Boolean)
      #   * :can_email (Boolean)
      #   * :locations (Array<String>)
      #   * :phone_numbers (Array<Ats::PhoneNumberRequest>)
      #   * :email_addresses (Array<Ats::EmailAddressRequest>)
      #   * :urls (Array<Ats::UrlRequest>)
      #   * :tags (Array<String>)
      #   * :applications (Array<String>)
      #   * :attachments (Array<String>)
      #   * :remote_template_id (String)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param remote_user_id [String]
      # @param request_options [RequestOptions]
      # @return [Ats::CandidateResponse]
      def partial_update(id:, model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.patch("/api/ats/v1/candidates/#{id}") do |req|
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
          Ats::CandidateResponse.from_json(json_object: response.body)
        end
      end

      # Ignores a specific row based on the `model_id` in the url. These records will have their properties set to null, and will not be updated in future syncs. The "reason" and "message" fields in the request body will be stored for audit purposes.
      #
      # @param model_id [String]
      # @param reason [REASON_ENUM]
      # @param message [String]
      # @param request_options [RequestOptions]
      # @return [Void]
      def ignore_create(model_id:, reason:, message: nil, request_options: nil)
        Async do
          @request_client.conn.post("/api/ats/v1/candidates/ignore/#{model_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              reason: reason,
              message: message
            }.compact
          end
        end
      end

      # Returns metadata for `Candidate` PATCHs.
      #
      # @param id [String]
      # @param request_options [RequestOptions]
      # @return [Ats::MetaResponse]
      def meta_patch_retrieve(id:, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ats/v1/candidates/meta/patch/#{id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Ats::MetaResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Candidate` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Ats::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ats/v1/candidates/meta/post") do |req|
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
