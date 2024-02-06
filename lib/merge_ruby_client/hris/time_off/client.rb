# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/time_off_list_request_expand"
require_relative "types/time_off_list_request_remote_fields"
require_relative "types/time_off_list_request_request_type"
require_relative "types/time_off_list_request_show_enum_origins"
require_relative "types/time_off_list_request_status"
require_relative "../types/paginated_time_off_list"
require_relative "../types/time_off_request"
require_relative "../types/time_off_response"
require_relative "types/time_off_retrieve_request_expand"
require_relative "types/time_off_retrieve_request_remote_fields"
require_relative "types/time_off_retrieve_request_show_enum_origins"
require_relative "../types/time_off"
require_relative "../types/meta_response"
require "async"

module Merge
  module Hris
    class TimeOffClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Hris::TimeOffClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `TimeOff` objects.
      #
      # @param approver_id [String] If provided, will only return time off for this approver.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param employee_id [String] If provided, will only return time off for this employee.
      # @param expand [TIME_OFF_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [TIME_OFF_LIST_REQUEST_REMOTE_FIELDS] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_type [TIME_OFF_LIST_REQUEST_REQUEST_TYPE] If provided, will only return TimeOff with this request type. Options: ('VACATION', 'SICK', 'PERSONAL', 'JURY_DUTY', 'VOLUNTEER', 'BEREAVEMENT')
      #   - `VACATION` - VACATION
      #   - `SICK` - SICK
      #   - `PERSONAL` - PERSONAL
      #   - `JURY_DUTY` - JURY_DUTY
      #   - `VOLUNTEER` - VOLUNTEER
      #   - `BEREAVEMENT` - BEREAVEMENT
      # @param show_enum_origins [TIME_OFF_LIST_REQUEST_SHOW_ENUM_ORIGINS] Which fields should be returned in non-normalized form.
      # @param status [TIME_OFF_LIST_REQUEST_STATUS] If provided, will only return TimeOff with this status. Options: ('REQUESTED', 'APPROVED', 'DECLINED', 'CANCELLED', 'DELETED')
      #   - `REQUESTED` - REQUESTED
      #   - `APPROVED` - APPROVED
      #   - `DECLINED` - DECLINED
      #   - `CANCELLED` - CANCELLED
      #   - `DELETED` - DELETED
      # @param request_options [RequestOptions]
      # @return [Hris::PaginatedTimeOffList]
      def list(approver_id: nil, created_after: nil, created_before: nil, cursor: nil, employee_id: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, request_type: nil, show_enum_origins: nil, status: nil, request_options: nil)
        response = @request_client.conn.get("/api/hris/v1/time-off") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "approver_id": approver_id,
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "employee_id": employee_id,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "page_size": page_size,
            "remote_fields": remote_fields,
            "remote_id": remote_id,
            "request_type": request_type,
            "show_enum_origins": show_enum_origins,
            "status": status
          }.compact
        end
        Hris::PaginatedTimeOffList.from_json(json_object: response.body)
      end

      # Creates a `TimeOff` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Hris::TimeOffRequest, as a Hash
      #   * :employee (Hash)
      #   * :approver (Hash)
      #   * :status (Hash)
      #   * :employee_note (String)
      #   * :units (Hash)
      #   * :amount (Float)
      #   * :request_type (Hash)
      #   * :start_time (DateTime)
      #   * :end_time (DateTime)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param request_options [RequestOptions]
      # @return [Hris::TimeOffResponse]
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.post("/api/hris/v1/time-off") do |req|
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
        Hris::TimeOffResponse.from_json(json_object: response.body)
      end

      # Returns a `TimeOff` object with the given `id`.
      #
      # @param id [String]
      # @param expand [TIME_OFF_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param remote_fields [TIME_OFF_RETRIEVE_REQUEST_REMOTE_FIELDS] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [TIME_OFF_RETRIEVE_REQUEST_SHOW_ENUM_ORIGINS] Which fields should be returned in non-normalized form.
      # @param request_options [RequestOptions]
      # @return [Hris::TimeOff]
      def retrieve(id:, expand: nil, include_remote_data: nil, remote_fields: nil, show_enum_origins: nil,
                   request_options: nil)
        response = @request_client.conn.get("/api/hris/v1/time-off/#{id}") do |req|
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
        Hris::TimeOff.from_json(json_object: response.body)
      end

      # Returns metadata for `TimeOff` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Hris::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        response = @request_client.conn.get("/api/hris/v1/time-off/meta/post") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Hris::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncTimeOffClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Hris::AsyncTimeOffClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `TimeOff` objects.
      #
      # @param approver_id [String] If provided, will only return time off for this approver.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param employee_id [String] If provided, will only return time off for this employee.
      # @param expand [TIME_OFF_LIST_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [TIME_OFF_LIST_REQUEST_REMOTE_FIELDS] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_type [TIME_OFF_LIST_REQUEST_REQUEST_TYPE] If provided, will only return TimeOff with this request type. Options: ('VACATION', 'SICK', 'PERSONAL', 'JURY_DUTY', 'VOLUNTEER', 'BEREAVEMENT')
      #   - `VACATION` - VACATION
      #   - `SICK` - SICK
      #   - `PERSONAL` - PERSONAL
      #   - `JURY_DUTY` - JURY_DUTY
      #   - `VOLUNTEER` - VOLUNTEER
      #   - `BEREAVEMENT` - BEREAVEMENT
      # @param show_enum_origins [TIME_OFF_LIST_REQUEST_SHOW_ENUM_ORIGINS] Which fields should be returned in non-normalized form.
      # @param status [TIME_OFF_LIST_REQUEST_STATUS] If provided, will only return TimeOff with this status. Options: ('REQUESTED', 'APPROVED', 'DECLINED', 'CANCELLED', 'DELETED')
      #   - `REQUESTED` - REQUESTED
      #   - `APPROVED` - APPROVED
      #   - `DECLINED` - DECLINED
      #   - `CANCELLED` - CANCELLED
      #   - `DELETED` - DELETED
      # @param request_options [RequestOptions]
      # @return [Hris::PaginatedTimeOffList]
      def list(approver_id: nil, created_after: nil, created_before: nil, cursor: nil, employee_id: nil, expand: nil,
               include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, request_type: nil, show_enum_origins: nil, status: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/hris/v1/time-off") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "approver_id": approver_id,
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "employee_id": employee_id,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "page_size": page_size,
              "remote_fields": remote_fields,
              "remote_id": remote_id,
              "request_type": request_type,
              "show_enum_origins": show_enum_origins,
              "status": status
            }.compact
          end
          Hris::PaginatedTimeOffList.from_json(json_object: response.body)
        end
      end

      # Creates a `TimeOff` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Hris::TimeOffRequest, as a Hash
      #   * :employee (Hash)
      #   * :approver (Hash)
      #   * :status (Hash)
      #   * :employee_note (String)
      #   * :units (Hash)
      #   * :amount (Float)
      #   * :request_type (Hash)
      #   * :start_time (DateTime)
      #   * :end_time (DateTime)
      #   * :integration_params (Hash{String => String})
      #   * :linked_account_params (Hash{String => String})
      # @param request_options [RequestOptions]
      # @return [Hris::TimeOffResponse]
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/hris/v1/time-off") do |req|
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
          Hris::TimeOffResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `TimeOff` object with the given `id`.
      #
      # @param id [String]
      # @param expand [TIME_OFF_RETRIEVE_REQUEST_EXPAND] Which relations should be returned in expanded form. Multiple relation names should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to produce these models.
      # @param remote_fields [TIME_OFF_RETRIEVE_REQUEST_REMOTE_FIELDS] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [TIME_OFF_RETRIEVE_REQUEST_SHOW_ENUM_ORIGINS] Which fields should be returned in non-normalized form.
      # @param request_options [RequestOptions]
      # @return [Hris::TimeOff]
      def retrieve(id:, expand: nil, include_remote_data: nil, remote_fields: nil, show_enum_origins: nil,
                   request_options: nil)
        Async do
          response = @request_client.conn.get("/api/hris/v1/time-off/#{id}") do |req|
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
          Hris::TimeOff.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `TimeOff` POSTs.
      #
      # @param request_options [RequestOptions]
      # @return [Hris::MetaResponse]
      def meta_post_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get("/api/hris/v1/time-off/meta/post") do |req|
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
