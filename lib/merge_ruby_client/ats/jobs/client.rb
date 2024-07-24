# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/jobs_list_request_expand"
require_relative "types/jobs_list_request_status"
require_relative "../types/paginated_job_list"
require_relative "types/jobs_retrieve_request_expand"
require_relative "../types/job"
require_relative "types/jobs_screening_questions_list_request_expand"
require_relative "../types/paginated_screening_question_list"
require "async"

module Merge
  module Ats
    class JobsClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Ats::JobsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Job` objects.
      #
      # @param code [String] If provided, will only return jobs with this code.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Ats::Jobs::JobsListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param offices [String] If provided, will only return jobs for this office; multiple offices can be
      #  separated by commas.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [String] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param status [Merge::Ats::Jobs::JobsListRequestStatus] If provided, will only return jobs with this status. Options: ('OPEN', 'CLOSED',
      #  'DRAFT', 'ARCHIVED', 'PENDING')
      #  - `OPEN` - OPEN
      #  - `CLOSED` - CLOSED
      #  - `DRAFT` - DRAFT
      #  - `ARCHIVED` - ARCHIVED
      #  - `PENDING` - PENDING
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::PaginatedJobList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.jobs.list
      def list(code: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil, include_deleted_data: nil,
               include_remote_data: nil, modified_after: nil, modified_before: nil, offices: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, status: nil, request_options: nil)
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
            "code": code,
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "offices": offices,
            "page_size": page_size,
            "remote_fields": remote_fields,
            "remote_id": remote_id,
            "show_enum_origins": show_enum_origins,
            "status": status
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/jobs"
        end
        Merge::Ats::PaginatedJobList.from_json(json_object: response.body)
      end

      # Returns a `Job` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Ats::Jobs::JobsRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [String] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::Job]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.jobs.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, remote_fields: nil, show_enum_origins: nil,
                   request_options: nil)
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
            "include_remote_data": include_remote_data,
            "remote_fields": remote_fields,
            "show_enum_origins": show_enum_origins
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/jobs/#{id}"
        end
        Merge::Ats::Job.from_json(json_object: response.body)
      end

      # Returns a list of `ScreeningQuestion` objects.
      #
      # @param job_id [String]
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Ats::Jobs::JobsScreeningQuestionsListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::PaginatedScreeningQuestionList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.jobs.screening_questions_list(job_id: "job_id")
      def screening_questions_list(job_id:, cursor: nil, expand: nil, include_deleted_data: nil,
                                   include_remote_data: nil, page_size: nil, request_options: nil)
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
            "cursor": cursor,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "page_size": page_size
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/jobs/#{job_id}/screening-questions"
        end
        Merge::Ats::PaginatedScreeningQuestionList.from_json(json_object: response.body)
      end
    end

    class AsyncJobsClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Ats::AsyncJobsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Job` objects.
      #
      # @param code [String] If provided, will only return jobs with this code.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Ats::Jobs::JobsListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param offices [String] If provided, will only return jobs for this office; multiple offices can be
      #  separated by commas.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [String] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param status [Merge::Ats::Jobs::JobsListRequestStatus] If provided, will only return jobs with this status. Options: ('OPEN', 'CLOSED',
      #  'DRAFT', 'ARCHIVED', 'PENDING')
      #  - `OPEN` - OPEN
      #  - `CLOSED` - CLOSED
      #  - `DRAFT` - DRAFT
      #  - `ARCHIVED` - ARCHIVED
      #  - `PENDING` - PENDING
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::PaginatedJobList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.jobs.list
      def list(code: nil, created_after: nil, created_before: nil, cursor: nil, expand: nil, include_deleted_data: nil,
               include_remote_data: nil, modified_after: nil, modified_before: nil, offices: nil, page_size: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, status: nil, request_options: nil)
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
              "code": code,
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "offices": offices,
              "page_size": page_size,
              "remote_fields": remote_fields,
              "remote_id": remote_id,
              "show_enum_origins": show_enum_origins,
              "status": status
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/jobs"
          end
          Merge::Ats::PaginatedJobList.from_json(json_object: response.body)
        end
      end

      # Returns a `Job` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Ats::Jobs::JobsRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param remote_fields [String] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [String] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::Job]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.jobs.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, remote_fields: nil, show_enum_origins: nil,
                   request_options: nil)
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
              "include_remote_data": include_remote_data,
              "remote_fields": remote_fields,
              "show_enum_origins": show_enum_origins
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/jobs/#{id}"
          end
          Merge::Ats::Job.from_json(json_object: response.body)
        end
      end

      # Returns a list of `ScreeningQuestion` objects.
      #
      # @param job_id [String]
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Ats::Jobs::JobsScreeningQuestionsListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::PaginatedScreeningQuestionList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.jobs.screening_questions_list(job_id: "job_id")
      def screening_questions_list(job_id:, cursor: nil, expand: nil, include_deleted_data: nil,
                                   include_remote_data: nil, page_size: nil, request_options: nil)
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
              "cursor": cursor,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "page_size": page_size
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/jobs/#{job_id}/screening-questions"
          end
          Merge::Ats::PaginatedScreeningQuestionList.from_json(json_object: response.body)
        end
      end
    end
  end
end
