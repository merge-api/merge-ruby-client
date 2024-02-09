# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/timesheet_entries_list_request_order_by"
require_relative "../types/paginated_timesheet_entry_list"
require_relative "../types/timesheet_entry_request"
require_relative "../types/timesheet_entry_response"
require_relative "../types/timesheet_entry"
require_relative "../types/meta_response"
require "async"

module Merge
  module Hris
    class TimesheetEntriesClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Hris::TimesheetEntriesClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `TimesheetEntry` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param employee_id [String] If provided, will only return employee payroll runs for this employee.
      # @param ended_after [String] If provided, will only return employee payroll runs ended after this datetime.
      # @param ended_before [String] If provided, will only return employee payroll runs ended before this datetime.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param order_by [TIMESHEET_ENTRIES_LIST_REQUEST_ORDER_BY] Overrides the default ordering for this endpoint. Possible values include: start_time, -start_time.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param started_after [String] If provided, will only return employee payroll runs started after this datetime.
      # @param started_before [String] If provided, will only return employee payroll runs started before this datetime.
      # @param request_options [RequestOptions]
      # @return [Hris::PaginatedTimesheetEntryList]
      def list(created_after: nil, created_before: nil, cursor: nil, employee_id: nil, ended_after: nil,
               ended_before: nil, include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, order_by: nil, page_size: nil, remote_id: nil, started_after: nil, started_before: nil, request_options: nil)
        response = @request_client.conn.get("/api/hris/v1/timesheet-entries") do |req|
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
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "order_by": order_by,
            "page_size": page_size,
            "remote_id": remote_id,
            "started_after": started_after,
            "started_before": started_before
          }.compact
        end
        Hris::PaginatedTimesheetEntryList.from_json(json_object: response.body)
      end

      # Creates a `TimesheetEntry` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Hris::TimesheetEntryRequest, as a Hash
      #   * :employee (String)
      #   * :hours_worked (Float)
      #   * :start_time (DateTime)
      #   * :end_time (DateTime)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param request_options [RequestOptions]
      # @return [Hris::TimesheetEntryResponse]
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.post("/api/hris/v1/timesheet-entries") do |req|
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
        Hris::TimesheetEntryResponse.from_json(json_object: response.body)
      end

      # Returns a `TimesheetEntry` object with the given `id`.
      #
      # @param id [String]
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Hris::TimesheetEntry]
      def retrieve(id:, include_remote_data: nil, request_options: nil)
        response = @request_client.conn.get("/api/hris/v1/timesheet-entries/#{id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "include_remote_data": include_remote_data
          }.compact
        end
        Hris::TimesheetEntry.from_json(json_object: response.body)
      end

      # Returns metadata for `TimesheetEntry` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Hris::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        response = @request_client.conn.get("/api/hris/v1/timesheet-entries/meta/post") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Hris::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncTimesheetEntriesClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Hris::AsyncTimesheetEntriesClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `TimesheetEntry` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param employee_id [String] If provided, will only return employee payroll runs for this employee.
      # @param ended_after [String] If provided, will only return employee payroll runs ended after this datetime.
      # @param ended_before [String] If provided, will only return employee payroll runs ended before this datetime.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param order_by [TIMESHEET_ENTRIES_LIST_REQUEST_ORDER_BY] Overrides the default ordering for this endpoint. Possible values include: start_time, -start_time.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param started_after [String] If provided, will only return employee payroll runs started after this datetime.
      # @param started_before [String] If provided, will only return employee payroll runs started before this datetime.
      # @param request_options [RequestOptions]
      # @return [Hris::PaginatedTimesheetEntryList]
      def list(created_after: nil, created_before: nil, cursor: nil, employee_id: nil, ended_after: nil,
               ended_before: nil, include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, order_by: nil, page_size: nil, remote_id: nil, started_after: nil, started_before: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/hris/v1/timesheet-entries") do |req|
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
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "order_by": order_by,
              "page_size": page_size,
              "remote_id": remote_id,
              "started_after": started_after,
              "started_before": started_before
            }.compact
          end
          Hris::PaginatedTimesheetEntryList.from_json(json_object: response.body)
        end
      end

      # Creates a `TimesheetEntry` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Hris::TimesheetEntryRequest, as a Hash
      #   * :employee (String)
      #   * :hours_worked (Float)
      #   * :start_time (DateTime)
      #   * :end_time (DateTime)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param request_options [RequestOptions]
      # @return [Hris::TimesheetEntryResponse]
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/hris/v1/timesheet-entries") do |req|
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
          Hris::TimesheetEntryResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `TimesheetEntry` object with the given `id`.
      #
      # @param id [String]
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param request_options [RequestOptions]
      # @return [Hris::TimesheetEntry]
      def retrieve(id:, include_remote_data: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/hris/v1/timesheet-entries/#{id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "include_remote_data": include_remote_data
            }.compact
          end
          Hris::TimesheetEntry.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `TimesheetEntry` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Hris::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get("/api/hris/v1/timesheet-entries/meta/post") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Hris::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
