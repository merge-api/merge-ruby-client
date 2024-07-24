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
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Hris::TimeOffClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `TimeOff` objects.
      #
      # @param approver_id [String] If provided, will only return time off for this approver.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param employee_id [String] If provided, will only return time off for this employee.
      # @param ended_after [DateTime] If provided, will only return employees that ended after this datetime.
      # @param ended_before [DateTime] If provided, will only return time-offs that ended before this datetime.
      # @param expand [Merge::Hris::TimeOff::TimeOffListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [Merge::Hris::TimeOff::TimeOffListRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_type [Merge::Hris::TimeOff::TimeOffListRequestRequestType] If provided, will only return TimeOff with this request type. Options:
      #  ('VACATION', 'SICK', 'PERSONAL', 'JURY_DUTY', 'VOLUNTEER', 'BEREAVEMENT')
      #  - `VACATION` - VACATION
      #  - `SICK` - SICK
      #  - `PERSONAL` - PERSONAL
      #  - `JURY_DUTY` - JURY_DUTY
      #  - `VOLUNTEER` - VOLUNTEER
      #  - `BEREAVEMENT` - BEREAVEMENT
      # @param show_enum_origins [Merge::Hris::TimeOff::TimeOffListRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param started_after [DateTime] If provided, will only return time-offs that started after this datetime.
      # @param started_before [DateTime] If provided, will only return time-offs that started before this datetime.
      # @param status [Merge::Hris::TimeOff::TimeOffListRequestStatus] If provided, will only return TimeOff with this status. Options: ('REQUESTED',
      #  'APPROVED', 'DECLINED', 'CANCELLED', 'DELETED')
      #  - `REQUESTED` - REQUESTED
      #  - `APPROVED` - APPROVED
      #  - `DECLINED` - DECLINED
      #  - `CANCELLED` - CANCELLED
      #  - `DELETED` - DELETED
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::PaginatedTimeOffList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.time_off.list
      def list(approver_id: nil, created_after: nil, created_before: nil, cursor: nil, employee_id: nil,
               ended_after: nil, ended_before: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, request_type: nil, show_enum_origins: nil, started_after: nil, started_before: nil, status: nil, request_options: nil)
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
            "approver_id": approver_id,
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
            "remote_fields": remote_fields,
            "remote_id": remote_id,
            "request_type": request_type,
            "show_enum_origins": show_enum_origins,
            "started_after": started_after,
            "started_before": started_before,
            "status": status
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/time-off"
        end
        Merge::Hris::PaginatedTimeOffList.from_json(json_object: response.body)
      end

      # Creates a `TimeOff` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Hris::TimeOffRequest, as a Hash
      #   * :employee (Hash)
      #   * :approver (Hash)
      #   * :status (Merge::Hris::TimeOffStatusEnum)
      #   * :employee_note (String)
      #   * :units (Merge::Hris::UnitsEnum)
      #   * :amount (Float)
      #   * :request_type (Merge::Hris::RequestTypeEnum)
      #   * :start_time (DateTime)
      #   * :end_time (DateTime)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::TimeOffResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.time_off.create(model: {  })
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
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
          req.body = { **(request_options&.additional_body_parameters || {}), model: model }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/time-off"
        end
        Merge::Hris::TimeOffResponse.from_json(json_object: response.body)
      end

      # Returns a `TimeOff` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Hris::TimeOff::TimeOffRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param remote_fields [Merge::Hris::TimeOff::TimeOffRetrieveRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [Merge::Hris::TimeOff::TimeOffRetrieveRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::TimeOff]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.time_off.retrieve(id: "id")
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
          req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/time-off/#{id}"
        end
        Merge::Hris::TimeOff.from_json(json_object: response.body)
      end

      # Returns metadata for `TimeOff` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.time_off.meta_post_retrieve
      def meta_post_retrieve(request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/time-off/meta/post"
        end
        Merge::Hris::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncTimeOffClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Hris::AsyncTimeOffClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `TimeOff` objects.
      #
      # @param approver_id [String] If provided, will only return time off for this approver.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param employee_id [String] If provided, will only return time off for this employee.
      # @param ended_after [DateTime] If provided, will only return employees that ended after this datetime.
      # @param ended_before [DateTime] If provided, will only return time-offs that ended before this datetime.
      # @param expand [Merge::Hris::TimeOff::TimeOffListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_fields [Merge::Hris::TimeOff::TimeOffListRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param request_type [Merge::Hris::TimeOff::TimeOffListRequestRequestType] If provided, will only return TimeOff with this request type. Options:
      #  ('VACATION', 'SICK', 'PERSONAL', 'JURY_DUTY', 'VOLUNTEER', 'BEREAVEMENT')
      #  - `VACATION` - VACATION
      #  - `SICK` - SICK
      #  - `PERSONAL` - PERSONAL
      #  - `JURY_DUTY` - JURY_DUTY
      #  - `VOLUNTEER` - VOLUNTEER
      #  - `BEREAVEMENT` - BEREAVEMENT
      # @param show_enum_origins [Merge::Hris::TimeOff::TimeOffListRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param started_after [DateTime] If provided, will only return time-offs that started after this datetime.
      # @param started_before [DateTime] If provided, will only return time-offs that started before this datetime.
      # @param status [Merge::Hris::TimeOff::TimeOffListRequestStatus] If provided, will only return TimeOff with this status. Options: ('REQUESTED',
      #  'APPROVED', 'DECLINED', 'CANCELLED', 'DELETED')
      #  - `REQUESTED` - REQUESTED
      #  - `APPROVED` - APPROVED
      #  - `DECLINED` - DECLINED
      #  - `CANCELLED` - CANCELLED
      #  - `DELETED` - DELETED
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::PaginatedTimeOffList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.time_off.list
      def list(approver_id: nil, created_after: nil, created_before: nil, cursor: nil, employee_id: nil,
               ended_after: nil, ended_before: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_fields: nil, remote_id: nil, request_type: nil, show_enum_origins: nil, started_after: nil, started_before: nil, status: nil, request_options: nil)
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
              "approver_id": approver_id,
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
              "remote_fields": remote_fields,
              "remote_id": remote_id,
              "request_type": request_type,
              "show_enum_origins": show_enum_origins,
              "started_after": started_after,
              "started_before": started_before,
              "status": status
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/time-off"
          end
          Merge::Hris::PaginatedTimeOffList.from_json(json_object: response.body)
        end
      end

      # Creates a `TimeOff` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Hris::TimeOffRequest, as a Hash
      #   * :employee (Hash)
      #   * :approver (Hash)
      #   * :status (Merge::Hris::TimeOffStatusEnum)
      #   * :employee_note (String)
      #   * :units (Merge::Hris::UnitsEnum)
      #   * :amount (Float)
      #   * :request_type (Merge::Hris::RequestTypeEnum)
      #   * :start_time (DateTime)
      #   * :end_time (DateTime)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::TimeOffResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.time_off.create(model: {  })
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
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
            req.body = { **(request_options&.additional_body_parameters || {}), model: model }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/time-off"
          end
          Merge::Hris::TimeOffResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `TimeOff` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Hris::TimeOff::TimeOffRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param remote_fields [Merge::Hris::TimeOff::TimeOffRetrieveRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [Merge::Hris::TimeOff::TimeOffRetrieveRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::TimeOff]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.time_off.retrieve(id: "id")
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
            req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/time-off/#{id}"
          end
          Merge::Hris::TimeOff.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `TimeOff` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.time_off.meta_post_retrieve
      def meta_post_retrieve(request_options: nil)
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
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/time-off/meta/post"
          end
          Merge::Hris::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
