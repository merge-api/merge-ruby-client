# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/payroll_runs_list_request_remote_fields"
require_relative "types/payroll_runs_list_request_run_type"
require_relative "types/payroll_runs_list_request_show_enum_origins"
require_relative "../types/paginated_payroll_run_list"
require_relative "types/payroll_runs_retrieve_request_remote_fields"
require_relative "types/payroll_runs_retrieve_request_show_enum_origins"
require_relative "../types/payroll_run"
require "async"

module Merge
  module Hris
    class PayrollRunsClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Hris::PayrollRunsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `PayrollRun` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param ended_after [DateTime] If provided, will only return payroll runs ended after this datetime.
      # @param ended_before [DateTime] If provided, will only return payroll runs ended before this datetime.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [Merge::Hris::PayrollRuns::PayrollRunsListRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param run_type [Merge::Hris::PayrollRuns::PayrollRunsListRequestRunType] If provided, will only return PayrollRun's with this status. Options:
      #  ('REGULAR', 'OFF_CYCLE', 'CORRECTION', 'TERMINATION', 'SIGN_ON_BONUS')
      #  - `REGULAR` - REGULAR
      #  - `OFF_CYCLE` - OFF_CYCLE
      #  - `CORRECTION` - CORRECTION
      #  - `TERMINATION` - TERMINATION
      #  - `SIGN_ON_BONUS` - SIGN_ON_BONUS
      # @param show_enum_origins [Merge::Hris::PayrollRuns::PayrollRunsListRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param started_after [DateTime] If provided, will only return payroll runs started after this datetime.
      # @param started_before [DateTime] If provided, will only return payroll runs started before this datetime.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::PaginatedPayrollRunList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.payroll_runs.list
      def list(created_after: nil, created_before: nil, cursor: nil, ended_after: nil, ended_before: nil,
               include_deleted_data: nil, include_remote_data: nil, include_shell_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, run_type: nil, show_enum_origins: nil, started_after: nil, started_before: nil, request_options: nil)
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
            "ended_after": ended_after,
            "ended_before": ended_before,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_shell_data": include_shell_data,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "page_size": page_size,
            "remote_fields": remote_fields,
            "remote_id": remote_id,
            "run_type": run_type,
            "show_enum_origins": show_enum_origins,
            "started_after": started_after,
            "started_before": started_before
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/payroll-runs"
        end
        Merge::Hris::PaginatedPayrollRunList.from_json(json_object: response.body)
      end

      # Returns a `PayrollRun` object with the given `id`.
      #
      # @param id [String]
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param remote_fields [Merge::Hris::PayrollRuns::PayrollRunsRetrieveRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [Merge::Hris::PayrollRuns::PayrollRunsRetrieveRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::PayrollRun]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.payroll_runs.retrieve(id: "id")
      def retrieve(id:, include_remote_data: nil, include_shell_data: nil, remote_fields: nil, show_enum_origins: nil,
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
            "include_remote_data": include_remote_data,
            "include_shell_data": include_shell_data,
            "remote_fields": remote_fields,
            "show_enum_origins": show_enum_origins
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/payroll-runs/#{id}"
        end
        Merge::Hris::PayrollRun.from_json(json_object: response.body)
      end
    end

    class AsyncPayrollRunsClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Hris::AsyncPayrollRunsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `PayrollRun` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param ended_after [DateTime] If provided, will only return payroll runs ended after this datetime.
      # @param ended_before [DateTime] If provided, will only return payroll runs ended before this datetime.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [Merge::Hris::PayrollRuns::PayrollRunsListRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param run_type [Merge::Hris::PayrollRuns::PayrollRunsListRequestRunType] If provided, will only return PayrollRun's with this status. Options:
      #  ('REGULAR', 'OFF_CYCLE', 'CORRECTION', 'TERMINATION', 'SIGN_ON_BONUS')
      #  - `REGULAR` - REGULAR
      #  - `OFF_CYCLE` - OFF_CYCLE
      #  - `CORRECTION` - CORRECTION
      #  - `TERMINATION` - TERMINATION
      #  - `SIGN_ON_BONUS` - SIGN_ON_BONUS
      # @param show_enum_origins [Merge::Hris::PayrollRuns::PayrollRunsListRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param started_after [DateTime] If provided, will only return payroll runs started after this datetime.
      # @param started_before [DateTime] If provided, will only return payroll runs started before this datetime.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::PaginatedPayrollRunList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.payroll_runs.list
      def list(created_after: nil, created_before: nil, cursor: nil, ended_after: nil, ended_before: nil,
               include_deleted_data: nil, include_remote_data: nil, include_shell_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, run_type: nil, show_enum_origins: nil, started_after: nil, started_before: nil, request_options: nil)
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
              "ended_after": ended_after,
              "ended_before": ended_before,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_shell_data": include_shell_data,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "page_size": page_size,
              "remote_fields": remote_fields,
              "remote_id": remote_id,
              "run_type": run_type,
              "show_enum_origins": show_enum_origins,
              "started_after": started_after,
              "started_before": started_before
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/payroll-runs"
          end
          Merge::Hris::PaginatedPayrollRunList.from_json(json_object: response.body)
        end
      end

      # Returns a `PayrollRun` object with the given `id`.
      #
      # @param id [String]
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param remote_fields [Merge::Hris::PayrollRuns::PayrollRunsRetrieveRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [Merge::Hris::PayrollRuns::PayrollRunsRetrieveRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::PayrollRun]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.payroll_runs.retrieve(id: "id")
      def retrieve(id:, include_remote_data: nil, include_shell_data: nil, remote_fields: nil, show_enum_origins: nil,
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
              "include_remote_data": include_remote_data,
              "include_shell_data": include_shell_data,
              "remote_fields": remote_fields,
              "show_enum_origins": show_enum_origins
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/payroll-runs/#{id}"
          end
          Merge::Hris::PayrollRun.from_json(json_object: response.body)
        end
      end
    end
  end
end
