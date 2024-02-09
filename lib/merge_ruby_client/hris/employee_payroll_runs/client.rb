# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/employee_payroll_runs_list_request_expand"
require_relative "../types/paginated_employee_payroll_run_list"
require_relative "types/employee_payroll_runs_retrieve_request_expand"
require_relative "../types/employee_payroll_run"
require "async"

module Merge
  module Hris
    class EmployeePayrollRunsClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Hris::EmployeePayrollRunsClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `EmployeePayrollRun` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param employee_id [String] If provided, will only return employee payroll runs for this employee.
      # @param ended_after [DateTime] If provided, will only return employee payroll runs ended after this datetime.
      # @param ended_before [DateTime] If provided, will only return employee payroll runs ended before this datetime.
      # @param expand [EMPLOYEE_PAYROLL_RUNS_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param payroll_run_id [String] If provided, will only return employee payroll runs for this employee.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param started_after [DateTime] If provided, will only return employee payroll runs started after this datetime.
      # @param started_before [DateTime] If provided, will only return employee payroll runs started before this datetime.
      # @param request_options [RequestOptions]
      # @return [Hris::PaginatedEmployeePayrollRunList]
      def list(created_after: nil, created_before: nil, cursor: nil, employee_id: nil, ended_after: nil,
               ended_before: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, payroll_run_id: nil, remote_id: nil, started_after: nil, started_before: nil, request_options: nil)
        response = @request_client.conn.get("/api/hris/v1/employee-payroll-runs") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "employee_id": employee_id,
            "ended_after": ended_after,
            "ended_before": ended_before,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "page_size": page_size,
            "payroll_run_id": payroll_run_id,
            "remote_id": remote_id,
            "started_after": started_after,
            "started_before": started_before
          }.compact
        end
        Hris::PaginatedEmployeePayrollRunList.from_json(json_object: response.body)
      end

      # Returns an `EmployeePayrollRun` object with the given `id`.
      #
      # @param id [String]
      # @param expand [EMPLOYEE_PAYROLL_RUNS_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Hris::EmployeePayrollRun]
      def retrieve(id:, expand: nil, include_remote_data: nil, request_options: nil)
        response = @request_client.conn.get("/api/hris/v1/employee-payroll-runs/#{id}") do |req|
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
        Hris::EmployeePayrollRun.from_json(json_object: response.body)
      end
    end

    class AsyncEmployeePayrollRunsClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Hris::AsyncEmployeePayrollRunsClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `EmployeePayrollRun` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param employee_id [String] If provided, will only return employee payroll runs for this employee.
      # @param ended_after [DateTime] If provided, will only return employee payroll runs ended after this datetime.
      # @param ended_before [DateTime] If provided, will only return employee payroll runs ended before this datetime.
      # @param expand [EMPLOYEE_PAYROLL_RUNS_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param payroll_run_id [String] If provided, will only return employee payroll runs for this employee.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param started_after [DateTime] If provided, will only return employee payroll runs started after this datetime.
      # @param started_before [DateTime] If provided, will only return employee payroll runs started before this datetime.
      # @param request_options [RequestOptions]
      # @return [Hris::PaginatedEmployeePayrollRunList]
      def list(created_after: nil, created_before: nil, cursor: nil, employee_id: nil, ended_after: nil,
               ended_before: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, payroll_run_id: nil, remote_id: nil, started_after: nil, started_before: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/hris/v1/employee-payroll-runs") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "employee_id": employee_id,
              "ended_after": ended_after,
              "ended_before": ended_before,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "page_size": page_size,
              "payroll_run_id": payroll_run_id,
              "remote_id": remote_id,
              "started_after": started_after,
              "started_before": started_before
            }.compact
          end
          Hris::PaginatedEmployeePayrollRunList.from_json(json_object: response.body)
        end
      end

      # Returns an `EmployeePayrollRun` object with the given `id`.
      #
      # @param id [String]
      # @param expand [EMPLOYEE_PAYROLL_RUNS_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Hris::EmployeePayrollRun]
      def retrieve(id:, expand: nil, include_remote_data: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/hris/v1/employee-payroll-runs/#{id}") do |req|
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
          Hris::EmployeePayrollRun.from_json(json_object: response.body)
        end
      end
    end
  end
end
