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
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Ats::ApplicationsClient]
      def initialize(request_client:)
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
      # @param expand [Merge::Ats::Applications::ApplicationsListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param job_id [String] If provided, will only return applications for this job.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param reject_reason_id [String] If provided, will only return applications with this reject reason.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param source [String] If provided, will only return applications with this source.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::PaginatedApplicationList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.applications.list
      def list(candidate_id: nil, created_after: nil, created_before: nil, credited_to_id: nil, current_stage_id: nil,
               cursor: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, include_shell_data: nil, job_id: nil, modified_after: nil, modified_before: nil, page_size: nil, reject_reason_id: nil, remote_id: nil, source: nil, request_options: nil)
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
            "candidate_id": candidate_id,
            "created_after": created_after,
            "created_before": created_before,
            "credited_to_id": credited_to_id,
            "current_stage_id": current_stage_id,
            "cursor": cursor,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_shell_data": include_shell_data,
            "job_id": job_id,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "page_size": page_size,
            "reject_reason_id": reject_reason_id,
            "remote_id": remote_id,
            "source": source
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/applications"
        end
        Merge::Ats::PaginatedApplicationList.from_json(json_object: response.body)
      end

      # Creates an `Application` object with the given values.
      #  For certain integrations, but not all, our API detects duplicate candidates and
      #  will associate applications with existing records in the third-party. New
      #  candidates are created and automatically linked to the application.
      #  See our [Help Center
      #  tps://help.merge.dev/en/articles/10012366-updates-to-post-applications-oct-2024)
      #  for detailed support per integration.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Ats::ApplicationRequest, as a Hash
      #   * :candidate (Hash)
      #   * :job (Hash)
      #   * :applied_at (DateTime)
      #   * :rejected_at (DateTime)
      #   * :offers (Array<Merge::Ats::ApplicationRequestOffersItem>)
      #   * :source (String)
      #   * :credited_to (Hash)
      #   * :screening_question_answers (Array<Merge::Ats::ApplicationRequestScreeningQuestionAnswersItem>)
      #   * :current_stage (Hash)
      #   * :reject_reason (Hash)
      #   * :remote_template_id (String)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param remote_user_id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::ApplicationResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.applications.create(model: {  }, remote_user_id: "remote_user_id")
      def create(model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
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
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            model: model,
            remote_user_id: remote_user_id
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/applications"
        end
        Merge::Ats::ApplicationResponse.from_json(json_object: response.body)
      end

      # Returns an `Application` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Ats::Applications::ApplicationsRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::Application]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.applications.retrieve(id: "id")
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
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/applications/#{id}"
        end
        Merge::Ats::Application.from_json(json_object: response.body)
      end

      # Updates the `current_stage` field of an `Application` object
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param job_interview_stage [String] The interview stage to move the application to.
      # @param remote_user_id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::ApplicationResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.applications.change_stage_create(id: "id")
      def change_stage_create(id:, is_debug_mode: nil, run_async: nil, job_interview_stage: nil, remote_user_id: nil,
                              request_options: nil)
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
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            job_interview_stage: job_interview_stage,
            remote_user_id: remote_user_id
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/applications/#{id}/change-stage"
        end
        Merge::Ats::ApplicationResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `Application` POSTs.
      #
      # @param application_remote_template_id [String] The template ID associated with the nested application in the request.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.applications.meta_post_retrieve
      def meta_post_retrieve(application_remote_template_id: nil, request_options: nil)
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
            "application_remote_template_id": application_remote_template_id
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/applications/meta/post"
        end
        Merge::Ats::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncApplicationsClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Ats::AsyncApplicationsClient]
      def initialize(request_client:)
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
      # @param expand [Merge::Ats::Applications::ApplicationsListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param job_id [String] If provided, will only return applications for this job.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param reject_reason_id [String] If provided, will only return applications with this reject reason.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param source [String] If provided, will only return applications with this source.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::PaginatedApplicationList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.applications.list
      def list(candidate_id: nil, created_after: nil, created_before: nil, credited_to_id: nil, current_stage_id: nil,
               cursor: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, include_shell_data: nil, job_id: nil, modified_after: nil, modified_before: nil, page_size: nil, reject_reason_id: nil, remote_id: nil, source: nil, request_options: nil)
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
              "candidate_id": candidate_id,
              "created_after": created_after,
              "created_before": created_before,
              "credited_to_id": credited_to_id,
              "current_stage_id": current_stage_id,
              "cursor": cursor,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_shell_data": include_shell_data,
              "job_id": job_id,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "page_size": page_size,
              "reject_reason_id": reject_reason_id,
              "remote_id": remote_id,
              "source": source
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/applications"
          end
          Merge::Ats::PaginatedApplicationList.from_json(json_object: response.body)
        end
      end

      # Creates an `Application` object with the given values.
      #  For certain integrations, but not all, our API detects duplicate candidates and
      #  will associate applications with existing records in the third-party. New
      #  candidates are created and automatically linked to the application.
      #  See our [Help Center
      #  tps://help.merge.dev/en/articles/10012366-updates-to-post-applications-oct-2024)
      #  for detailed support per integration.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Ats::ApplicationRequest, as a Hash
      #   * :candidate (Hash)
      #   * :job (Hash)
      #   * :applied_at (DateTime)
      #   * :rejected_at (DateTime)
      #   * :offers (Array<Merge::Ats::ApplicationRequestOffersItem>)
      #   * :source (String)
      #   * :credited_to (Hash)
      #   * :screening_question_answers (Array<Merge::Ats::ApplicationRequestScreeningQuestionAnswersItem>)
      #   * :current_stage (Hash)
      #   * :reject_reason (Hash)
      #   * :remote_template_id (String)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param remote_user_id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::ApplicationResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.applications.create(model: {  }, remote_user_id: "remote_user_id")
      def create(model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
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
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              model: model,
              remote_user_id: remote_user_id
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/applications"
          end
          Merge::Ats::ApplicationResponse.from_json(json_object: response.body)
        end
      end

      # Returns an `Application` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Ats::Applications::ApplicationsRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::Application]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.applications.retrieve(id: "id")
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
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/applications/#{id}"
          end
          Merge::Ats::Application.from_json(json_object: response.body)
        end
      end

      # Updates the `current_stage` field of an `Application` object
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param job_interview_stage [String] The interview stage to move the application to.
      # @param remote_user_id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::ApplicationResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.applications.change_stage_create(id: "id")
      def change_stage_create(id:, is_debug_mode: nil, run_async: nil, job_interview_stage: nil, remote_user_id: nil,
                              request_options: nil)
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
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              job_interview_stage: job_interview_stage,
              remote_user_id: remote_user_id
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/applications/#{id}/change-stage"
          end
          Merge::Ats::ApplicationResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Application` POSTs.
      #
      # @param application_remote_template_id [String] The template ID associated with the nested application in the request.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.applications.meta_post_retrieve
      def meta_post_retrieve(application_remote_template_id: nil, request_options: nil)
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
              "application_remote_template_id": application_remote_template_id
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/applications/meta/post"
          end
          Merge::Ats::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
