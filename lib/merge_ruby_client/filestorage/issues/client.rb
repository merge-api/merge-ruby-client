# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/issues_list_request_status"
require_relative "../types/paginated_issue_list"
require_relative "../types/issue"
require "async"

module Merge
  module Filestorage
    class IssuesClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Filestorage::IssuesClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Gets issues.
      #
      # @param account_token [String]
      # @param cursor [String] The pagination cursor value.
      # @param end_date [String] If included, will only include issues whose most recent action occurred before this time
      # @param end_user_organization_name [String]
      # @param first_incident_time_after [DateTime] If provided, will only return issues whose first incident time was after this datetime.
      # @param first_incident_time_before [DateTime] If provided, will only return issues whose first incident time was before this datetime.
      # @param include_muted [String] If True, will include muted issues
      # @param integration_name [String]
      # @param last_incident_time_after [DateTime] If provided, will only return issues whose last incident time was after this datetime.
      # @param last_incident_time_before [DateTime] If provided, will only return issues whose last incident time was before this datetime.
      # @param page_size [Integer] Number of results to return per page.
      # @param start_date [String] If included, will only include issues whose most recent action occurred after this time
      # @param status [ISSUES_LIST_REQUEST_STATUS] Status of the issue. Options: ('ONGOING', 'RESOLVED')
      #   - `ONGOING` - ONGOING
      #   - `RESOLVED` - RESOLVED
      # @param request_options [RequestOptions]
      # @return [Filestorage::PaginatedIssueList]
      def list(account_token: nil, cursor: nil, end_date: nil, end_user_organization_name: nil,
               first_incident_time_after: nil, first_incident_time_before: nil, include_muted: nil, integration_name: nil, last_incident_time_after: nil, last_incident_time_before: nil, page_size: nil, start_date: nil, status: nil, request_options: nil)
        response = @request_client.conn.get("/api/filestorage/v1/issues") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "account_token": account_token,
            "cursor": cursor,
            "end_date": end_date,
            "end_user_organization_name": end_user_organization_name,
            "first_incident_time_after": first_incident_time_after,
            "first_incident_time_before": first_incident_time_before,
            "include_muted": include_muted,
            "integration_name": integration_name,
            "last_incident_time_after": last_incident_time_after,
            "last_incident_time_before": last_incident_time_before,
            "page_size": page_size,
            "start_date": start_date,
            "status": status
          }.compact
        end
        Filestorage::PaginatedIssueList.from_json(json_object: response.body)
      end

      # Get a specific issue.
      #
      # @param id [String]
      # @param request_options [RequestOptions]
      # @return [Filestorage::Issue]
      def retrieve(id:, request_options: nil)
        response = @request_client.conn.get("/api/filestorage/v1/issues/#{id}") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        Filestorage::Issue.from_json(json_object: response.body)
      end
    end

    class AsyncIssuesClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Filestorage::AsyncIssuesClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Gets issues.
      #
      # @param account_token [String]
      # @param cursor [String] The pagination cursor value.
      # @param end_date [String] If included, will only include issues whose most recent action occurred before this time
      # @param end_user_organization_name [String]
      # @param first_incident_time_after [DateTime] If provided, will only return issues whose first incident time was after this datetime.
      # @param first_incident_time_before [DateTime] If provided, will only return issues whose first incident time was before this datetime.
      # @param include_muted [String] If True, will include muted issues
      # @param integration_name [String]
      # @param last_incident_time_after [DateTime] If provided, will only return issues whose last incident time was after this datetime.
      # @param last_incident_time_before [DateTime] If provided, will only return issues whose last incident time was before this datetime.
      # @param page_size [Integer] Number of results to return per page.
      # @param start_date [String] If included, will only include issues whose most recent action occurred after this time
      # @param status [ISSUES_LIST_REQUEST_STATUS] Status of the issue. Options: ('ONGOING', 'RESOLVED')
      #   - `ONGOING` - ONGOING
      #   - `RESOLVED` - RESOLVED
      # @param request_options [RequestOptions]
      # @return [Filestorage::PaginatedIssueList]
      def list(account_token: nil, cursor: nil, end_date: nil, end_user_organization_name: nil,
               first_incident_time_after: nil, first_incident_time_before: nil, include_muted: nil, integration_name: nil, last_incident_time_after: nil, last_incident_time_before: nil, page_size: nil, start_date: nil, status: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/filestorage/v1/issues") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "account_token": account_token,
              "cursor": cursor,
              "end_date": end_date,
              "end_user_organization_name": end_user_organization_name,
              "first_incident_time_after": first_incident_time_after,
              "first_incident_time_before": first_incident_time_before,
              "include_muted": include_muted,
              "integration_name": integration_name,
              "last_incident_time_after": last_incident_time_after,
              "last_incident_time_before": last_incident_time_before,
              "page_size": page_size,
              "start_date": start_date,
              "status": status
            }.compact
          end
          Filestorage::PaginatedIssueList.from_json(json_object: response.body)
        end
      end

      # Get a specific issue.
      #
      # @param id [String]
      # @param request_options [RequestOptions]
      # @return [Filestorage::Issue]
      def retrieve(id:, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/filestorage/v1/issues/#{id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Filestorage::Issue.from_json(json_object: response.body)
        end
      end
    end
  end
end
