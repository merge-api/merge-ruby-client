# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/issues_list_request_status"
require_relative "../types/paginated_issue_list"
require_relative "../types/issue"
require "async"

module Merge
  module Ticketing
    class IssuesClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Ticketing::IssuesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Gets issues.
      #
      # @param account_token [String]
      # @param cursor [String] The pagination cursor value.
      # @param end_date [String] If included, will only include issues whose most recent action occurred before
      #  this time
      # @param end_user_organization_name [String]
      # @param first_incident_time_after [DateTime] If provided, will only return issues whose first incident time was after this
      #  datetime.
      # @param first_incident_time_before [DateTime] If provided, will only return issues whose first incident time was before this
      #  datetime.
      # @param include_muted [String] If true, will include muted issues
      # @param integration_name [String]
      # @param last_incident_time_after [DateTime] If provided, will only return issues whose last incident time was after this
      #  datetime.
      # @param last_incident_time_before [DateTime] If provided, will only return issues whose last incident time was before this
      #  datetime.
      # @param page_size [Integer] Number of results to return per page.
      # @param start_date [String] If included, will only include issues whose most recent action occurred after
      #  this time
      # @param status [Merge::Ticketing::Issues::IssuesListRequestStatus] Status of the issue. Options: ('ONGOING', 'RESOLVED')
      #  - `ONGOING` - ONGOING
      #  - `RESOLVED` - RESOLVED
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::PaginatedIssueList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.issues.list
      def list(account_token: nil, cursor: nil, end_date: nil, end_user_organization_name: nil,
               first_incident_time_after: nil, first_incident_time_before: nil, include_muted: nil, integration_name: nil, last_incident_time_after: nil, last_incident_time_before: nil, page_size: nil, start_date: nil, status: nil, request_options: nil)
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
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/issues"
        end
        Merge::Ticketing::PaginatedIssueList.from_json(json_object: response.body)
      end

      # Get a specific issue.
      #
      # @param id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::Issue]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.issues.retrieve(id: "id")
      def retrieve(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/issues/#{id}"
        end
        Merge::Ticketing::Issue.from_json(json_object: response.body)
      end
    end

    class AsyncIssuesClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Ticketing::AsyncIssuesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Gets issues.
      #
      # @param account_token [String]
      # @param cursor [String] The pagination cursor value.
      # @param end_date [String] If included, will only include issues whose most recent action occurred before
      #  this time
      # @param end_user_organization_name [String]
      # @param first_incident_time_after [DateTime] If provided, will only return issues whose first incident time was after this
      #  datetime.
      # @param first_incident_time_before [DateTime] If provided, will only return issues whose first incident time was before this
      #  datetime.
      # @param include_muted [String] If true, will include muted issues
      # @param integration_name [String]
      # @param last_incident_time_after [DateTime] If provided, will only return issues whose last incident time was after this
      #  datetime.
      # @param last_incident_time_before [DateTime] If provided, will only return issues whose last incident time was before this
      #  datetime.
      # @param page_size [Integer] Number of results to return per page.
      # @param start_date [String] If included, will only include issues whose most recent action occurred after
      #  this time
      # @param status [Merge::Ticketing::Issues::IssuesListRequestStatus] Status of the issue. Options: ('ONGOING', 'RESOLVED')
      #  - `ONGOING` - ONGOING
      #  - `RESOLVED` - RESOLVED
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::PaginatedIssueList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.issues.list
      def list(account_token: nil, cursor: nil, end_date: nil, end_user_organization_name: nil,
               first_incident_time_after: nil, first_incident_time_before: nil, include_muted: nil, integration_name: nil, last_incident_time_after: nil, last_incident_time_before: nil, page_size: nil, start_date: nil, status: nil, request_options: nil)
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
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/issues"
          end
          Merge::Ticketing::PaginatedIssueList.from_json(json_object: response.body)
        end
      end

      # Get a specific issue.
      #
      # @param id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::Issue]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.issues.retrieve(id: "id")
      def retrieve(id:, request_options: nil)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/issues/#{id}"
          end
          Merge::Ticketing::Issue.from_json(json_object: response.body)
        end
      end
    end
  end
end
