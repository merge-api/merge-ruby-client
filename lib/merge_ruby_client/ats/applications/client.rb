# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/applications_list_request_expand"
require_relative "../types/paginated_application_list"
require_relative "../types/application_request"
require_relative "../types/application_response"
require_relative "types/applications_retrieve_request_expand"
require_relative "../types/application"
require_relative "../types/meta_response"
require "async"

module Merge
  module Ats
    class ApplicationsClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Ats::ApplicationsClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `Application` objects.
      #
      # @param candidate_id [String] If provided, will only return applications for this candidate.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param credited_to_id [String] If provided, will only return applications credited to this user.
      # @param current_stage_id [String] If provided, will only return applications at this interview stage.
      # @param cursor [String] The pagination cursor value.
      # @param expand [APPLICATIONS_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param job_id [String] If provided, will only return applications for this job.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param reject_reason_id [String] If provided, will only return applications with this reject reason.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param source [String] If provided, will only return applications with this source.
      # @param request_options [RequestOptions]
      # @return [Ats::PaginatedApplicationList]
      def list(candidate_id: nil, created_after: nil, created_before: nil, credited_to_id: nil, current_stage_id: nil,
               cursor: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, job_id: nil, modified_after: nil, modified_before: nil, page_size: nil, reject_reason_id: nil, remote_id: nil, source: nil, request_options: nil)
        response = @request_client.conn.get("/api/ats/v1/applications") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "candidate_id": candidate_id,
            "created_after": created_after,
            "created_before": created_before,
            "credited_to_id": credited_to_id,
            "current_stage_id": current_stage_id,
            "cursor": cursor,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "job_id": job_id,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "page_size": page_size,
            "reject_reason_id": reject_reason_id,
            "remote_id": remote_id,
            "source": source
          }.compact
        end
        Ats::PaginatedApplicationList.from_json(json_object: response.body)
      end

      # Creates an `Application` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Ats::ApplicationRequest, as a Hash
      #   * :candidate (Hash)
      #   * :job (Hash)
      #   * :applied_at (DateTime)
      #   * :rejected_at (DateTime)
      #   * :source (String)
      #   * :credited_to (Hash)
      #   * :current_stage (Hash)
      #   * :reject_reason (Hash)
      #   * :remote_template_id (String)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param remote_user_id [String]
      # @param request_options [RequestOptions]
      # @return [Ats::ApplicationResponse]
      def create(model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.post("/api/ats/v1/applications") do |req|
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
        Ats::ApplicationResponse.from_json(json_object: response.body)
      end

      # Returns an `Application` object with the given `id`.
      #
      # @param id [String]
      # @param expand [APPLICATIONS_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Ats::Application]
      def retrieve(id:, expand: nil, include_remote_data: nil, request_options: nil)
        response = @request_client.conn.get("/api/ats/v1/applications/#{id}") do |req|
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
        Ats::Application.from_json(json_object: response.body)
      end

      # Updates the `current_stage` field of an `Application` object
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param job_interview_stage [String] The interview stage to move the application to.
      # @param remote_user_id [String]
      # @param request_options [RequestOptions]
      # @return [Ats::ApplicationResponse]
      def change_stage_create(id:, is_debug_mode: nil, run_async: nil, job_interview_stage: nil, remote_user_id: nil,
                              request_options: nil)
        response = @request_client.conn.post("/api/ats/v1/applications/#{id}/change-stage") do |req|
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
            job_interview_stage: job_interview_stage,
            remote_user_id: remote_user_id
          }.compact
        end
        Ats::ApplicationResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `Application` POSTs.
      #
      # @param application_remote_template_id [String] The template ID associated with the nested application in the request.
      # @param request_options [RequestOptions]
      # @return [Ats::MetaResponse]
      def meta_post_retrieve(application_remote_template_id: nil, request_options: nil)
        response = @request_client.conn.get("/api/ats/v1/applications/meta/post") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "application_remote_template_id": application_remote_template_id
          }.compact
        end
        Ats::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncApplicationsClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Ats::AsyncApplicationsClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `Application` objects.
      #
      # @param candidate_id [String] If provided, will only return applications for this candidate.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param credited_to_id [String] If provided, will only return applications credited to this user.
      # @param current_stage_id [String] If provided, will only return applications at this interview stage.
      # @param cursor [String] The pagination cursor value.
      # @param expand [APPLICATIONS_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param job_id [String] If provided, will only return applications for this job.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param reject_reason_id [String] If provided, will only return applications with this reject reason.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param source [String] If provided, will only return applications with this source.
      # @param request_options [RequestOptions]
      # @return [Ats::PaginatedApplicationList]
      def list(candidate_id: nil, created_after: nil, created_before: nil, credited_to_id: nil, current_stage_id: nil,
               cursor: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, job_id: nil, modified_after: nil, modified_before: nil, page_size: nil, reject_reason_id: nil, remote_id: nil, source: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ats/v1/applications") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "candidate_id": candidate_id,
              "created_after": created_after,
              "created_before": created_before,
              "credited_to_id": credited_to_id,
              "current_stage_id": current_stage_id,
              "cursor": cursor,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "job_id": job_id,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "page_size": page_size,
              "reject_reason_id": reject_reason_id,
              "remote_id": remote_id,
              "source": source
            }.compact
          end
          Ats::PaginatedApplicationList.from_json(json_object: response.body)
        end
      end

      # Creates an `Application` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Ats::ApplicationRequest, as a Hash
      #   * :candidate (Hash)
      #   * :job (Hash)
      #   * :applied_at (DateTime)
      #   * :rejected_at (DateTime)
      #   * :source (String)
      #   * :credited_to (Hash)
      #   * :current_stage (Hash)
      #   * :reject_reason (Hash)
      #   * :remote_template_id (String)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param remote_user_id [String]
      # @param request_options [RequestOptions]
      # @return [Ats::ApplicationResponse]
      def create(model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/ats/v1/applications") do |req|
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
          Ats::ApplicationResponse.from_json(json_object: response.body)
        end
      end

      # Returns an `Application` object with the given `id`.
      #
      # @param id [String]
      # @param expand [APPLICATIONS_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Ats::Application]
      def retrieve(id:, expand: nil, include_remote_data: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ats/v1/applications/#{id}") do |req|
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
          Ats::Application.from_json(json_object: response.body)
        end
      end

      # Updates the `current_stage` field of an `Application` object
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param job_interview_stage [String] The interview stage to move the application to.
      # @param remote_user_id [String]
      # @param request_options [RequestOptions]
      # @return [Ats::ApplicationResponse]
      def change_stage_create(id:, is_debug_mode: nil, run_async: nil, job_interview_stage: nil, remote_user_id: nil,
                              request_options: nil)
        Async do
          response = @request_client.conn.post("/api/ats/v1/applications/#{id}/change-stage") do |req|
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
              job_interview_stage: job_interview_stage,
              remote_user_id: remote_user_id
            }.compact
          end
          Ats::ApplicationResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Application` POSTs.
      #
      # @param application_remote_template_id [String] The template ID associated with the nested application in the request.
      # @param request_options [RequestOptions]
      # @return [Ats::MetaResponse]
      def meta_post_retrieve(application_remote_template_id: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ats/v1/applications/meta/post") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "application_remote_template_id": application_remote_template_id
            }.compact
          end
          Ats::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
