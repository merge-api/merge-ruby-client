# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/interviews_list_request_expand"
require_relative "../types/paginated_scheduled_interview_list"
require_relative "../types/scheduled_interview_request"
require_relative "../types/scheduled_interview_response"
require_relative "types/interviews_retrieve_request_expand"
require_relative "../types/scheduled_interview"
require_relative "../types/meta_response"
require "async"

module Merge
  module Ats
    class InterviewsClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Ats::InterviewsClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `ScheduledInterview` objects.
      #
      # @param application_id [String] If provided, will only return interviews for this application.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [INTERVIEWS_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param job_id [String] If provided, wll only return interviews organized for this job.
      # @param job_interview_stage_id [String] If provided, will only return interviews at this stage.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param organizer_id [String] If provided, will only return interviews organized by this user.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [String] Which fields should be returned in non-normalized form.
      # @param request_options [RequestOptions]
      # @return [Ats::PaginatedScheduledInterviewList]
      def list(application_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, job_id: nil, job_interview_stage_id: nil, modified_after: nil, modified_before: nil, organizer_id: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, request_options: nil)
        response = @request_client.conn.get("/api/ats/v1/interviews") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "application_id": application_id,
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "job_id": job_id,
            "job_interview_stage_id": job_interview_stage_id,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "organizer_id": organizer_id,
            "page_size": page_size,
            "remote_fields": remote_fields,
            "remote_id": remote_id,
            "show_enum_origins": show_enum_origins
          }.compact
        end
        Ats::PaginatedScheduledInterviewList.from_json(json_object: response.body)
      end

      # Creates a `ScheduledInterview` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Ats::ScheduledInterviewRequest, as a Hash
      #   * :application (Hash)
      #   * :job_interview_stage (Hash)
      #   * :organizer (Hash)
      #   * :interviewers (Array<Ats::ScheduledInterviewRequestInterviewersItem>)
      #   * :location (String)
      #   * :start_at (DateTime)
      #   * :end_at (DateTime)
      #   * :status (Hash)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param remote_user_id [String]
      # @param request_options [RequestOptions]
      # @return [Ats::ScheduledInterviewResponse]
      def create(model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.post("/api/ats/v1/interviews") do |req|
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
        Ats::ScheduledInterviewResponse.from_json(json_object: response.body)
      end

      # Returns a `ScheduledInterview` object with the given `id`.
      #
      # @param id [String]
      # @param expand [INTERVIEWS_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [String] Which fields should be returned in non-normalized form.
      # @param request_options [RequestOptions]
      # @return [Ats::ScheduledInterview]
      def retrieve(id:, expand: nil, include_remote_data: nil, remote_fields: nil, show_enum_origins: nil,
                   request_options: nil)
        response = @request_client.conn.get("/api/ats/v1/interviews/#{id}") do |req|
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
        Ats::ScheduledInterview.from_json(json_object: response.body)
      end

      # Returns metadata for `ScheduledInterview` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Ats::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        response = @request_client.conn.get("/api/ats/v1/interviews/meta/post") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Ats::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncInterviewsClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Ats::AsyncInterviewsClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `ScheduledInterview` objects.
      #
      # @param application_id [String] If provided, will only return interviews for this application.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [INTERVIEWS_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param job_id [String] If provided, wll only return interviews organized for this job.
      # @param job_interview_stage_id [String] If provided, will only return interviews at this stage.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param organizer_id [String] If provided, will only return interviews organized by this user.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [String] Which fields should be returned in non-normalized form.
      # @param request_options [RequestOptions]
      # @return [Ats::PaginatedScheduledInterviewList]
      def list(application_id: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, job_id: nil, job_interview_stage_id: nil, modified_after: nil, modified_before: nil, organizer_id: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ats/v1/interviews") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "application_id": application_id,
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "job_id": job_id,
              "job_interview_stage_id": job_interview_stage_id,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "organizer_id": organizer_id,
              "page_size": page_size,
              "remote_fields": remote_fields,
              "remote_id": remote_id,
              "show_enum_origins": show_enum_origins
            }.compact
          end
          Ats::PaginatedScheduledInterviewList.from_json(json_object: response.body)
        end
      end

      # Creates a `ScheduledInterview` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Ats::ScheduledInterviewRequest, as a Hash
      #   * :application (Hash)
      #   * :job_interview_stage (Hash)
      #   * :organizer (Hash)
      #   * :interviewers (Array<Ats::ScheduledInterviewRequestInterviewersItem>)
      #   * :location (String)
      #   * :start_at (DateTime)
      #   * :end_at (DateTime)
      #   * :status (Hash)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param remote_user_id [String]
      # @param request_options [RequestOptions]
      # @return [Ats::ScheduledInterviewResponse]
      def create(model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/ats/v1/interviews") do |req|
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
          Ats::ScheduledInterviewResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `ScheduledInterview` object with the given `id`.
      #
      # @param id [String]
      # @param expand [INTERVIEWS_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [String] Which fields should be returned in non-normalized form.
      # @param request_options [RequestOptions]
      # @return [Ats::ScheduledInterview]
      def retrieve(id:, expand: nil, include_remote_data: nil, remote_fields: nil, show_enum_origins: nil,
                   request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ats/v1/interviews/#{id}") do |req|
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
          Ats::ScheduledInterview.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `ScheduledInterview` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Ats::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ats/v1/interviews/meta/post") do |req|
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
