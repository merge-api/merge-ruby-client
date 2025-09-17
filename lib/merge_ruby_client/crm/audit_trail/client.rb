# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/paginated_audit_log_event_list"
require "async"

module Merge
  module Crm
    class AuditTrailClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Crm::AuditTrailClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Gets a list of audit trail events.
      #
      # @param cursor [String] The pagination cursor value.
      # @param end_date [String] If included, will only include audit trail events that occurred before this time
      # @param event_type [String] If included, will only include events with the given event type. Possible values
      #  include: `CREATED_REMOTE_PRODUCTION_API_KEY`,
      #  `DELETED_REMOTE_PRODUCTION_API_KEY`, `CREATED_TEST_API_KEY`,
      #  `DELETED_TEST_API_KEY`, `REGENERATED_PRODUCTION_API_KEY`,
      #  `REGENERATED_WEBHOOK_SIGNATURE`, `INVITED_USER`, `TWO_FACTOR_AUTH_ENABLED`,
      #  `TWO_FACTOR_AUTH_DISABLED`, `DELETED_LINKED_ACCOUNT`,
      #  `DELETED_ALL_COMMON_MODELS_FOR_LINKED_ACCOUNT`, `CREATED_DESTINATION`,
      #  `DELETED_DESTINATION`, `CHANGED_DESTINATION`, `CHANGED_SCOPES`,
      #  `CHANGED_PERSONAL_INFORMATION`, `CHANGED_ORGANIZATION_SETTINGS`,
      #  `ENABLED_INTEGRATION`, `DISABLED_INTEGRATION`, `ENABLED_CATEGORY`,
      #  `DISABLED_CATEGORY`, `CHANGED_PASSWORD`, `RESET_PASSWORD`,
      #  `ENABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION`,
      #  `ENABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT`,
      #  `DISABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION`,
      #  `DISABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT`,
      #  `CREATED_INTEGRATION_WIDE_FIELD_MAPPING`,
      #  `CREATED_LINKED_ACCOUNT_FIELD_MAPPING`,
      #  `CHANGED_INTEGRATION_WIDE_FIELD_MAPPING`,
      #  `CHANGED_LINKED_ACCOUNT_FIELD_MAPPING`,
      #  `DELETED_INTEGRATION_WIDE_FIELD_MAPPING`,
      #  `DELETED_LINKED_ACCOUNT_FIELD_MAPPING`,
      #  `CREATED_LINKED_ACCOUNT_COMMON_MODEL_OVERRIDE`,
      #  `CHANGED_LINKED_ACCOUNT_COMMON_MODEL_OVERRIDE`,
      #  `DELETED_LINKED_ACCOUNT_COMMON_MODEL_OVERRIDE`, `FORCED_LINKED_ACCOUNT_RESYNC`,
      #  `MUTED_ISSUE`, `GENERATED_MAGIC_LINK`, `ENABLED_MERGE_WEBHOOK`,
      #  `DISABLED_MERGE_WEBHOOK`, `MERGE_WEBHOOK_TARGET_CHANGED`,
      #  `END_USER_CREDENTIALS_ACCESSED`
      # @param page_size [Integer] Number of results to return per page.
      # @param start_date [String] If included, will only include audit trail events that occurred after this time
      # @param user_email [String] If provided, this will return events associated with the specified user email.
      #  Please note that the email address reflects the user's email at the time of the
      #  event, and may not be their current email.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::PaginatedAuditLogEventList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.audit_trail.list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def list(cursor: nil, end_date: nil, event_type: nil, page_size: nil, start_date: nil, user_email: nil,
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
            "cursor": cursor,
            "end_date": end_date,
            "event_type": event_type,
            "page_size": page_size,
            "start_date": start_date,
            "user_email": user_email
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/audit-trail"
        end
        Merge::Crm::PaginatedAuditLogEventList.from_json(json_object: response.body)
      end
    end

    class AsyncAuditTrailClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Crm::AsyncAuditTrailClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Gets a list of audit trail events.
      #
      # @param cursor [String] The pagination cursor value.
      # @param end_date [String] If included, will only include audit trail events that occurred before this time
      # @param event_type [String] If included, will only include events with the given event type. Possible values
      #  include: `CREATED_REMOTE_PRODUCTION_API_KEY`,
      #  `DELETED_REMOTE_PRODUCTION_API_KEY`, `CREATED_TEST_API_KEY`,
      #  `DELETED_TEST_API_KEY`, `REGENERATED_PRODUCTION_API_KEY`,
      #  `REGENERATED_WEBHOOK_SIGNATURE`, `INVITED_USER`, `TWO_FACTOR_AUTH_ENABLED`,
      #  `TWO_FACTOR_AUTH_DISABLED`, `DELETED_LINKED_ACCOUNT`,
      #  `DELETED_ALL_COMMON_MODELS_FOR_LINKED_ACCOUNT`, `CREATED_DESTINATION`,
      #  `DELETED_DESTINATION`, `CHANGED_DESTINATION`, `CHANGED_SCOPES`,
      #  `CHANGED_PERSONAL_INFORMATION`, `CHANGED_ORGANIZATION_SETTINGS`,
      #  `ENABLED_INTEGRATION`, `DISABLED_INTEGRATION`, `ENABLED_CATEGORY`,
      #  `DISABLED_CATEGORY`, `CHANGED_PASSWORD`, `RESET_PASSWORD`,
      #  `ENABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION`,
      #  `ENABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT`,
      #  `DISABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION`,
      #  `DISABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT`,
      #  `CREATED_INTEGRATION_WIDE_FIELD_MAPPING`,
      #  `CREATED_LINKED_ACCOUNT_FIELD_MAPPING`,
      #  `CHANGED_INTEGRATION_WIDE_FIELD_MAPPING`,
      #  `CHANGED_LINKED_ACCOUNT_FIELD_MAPPING`,
      #  `DELETED_INTEGRATION_WIDE_FIELD_MAPPING`,
      #  `DELETED_LINKED_ACCOUNT_FIELD_MAPPING`,
      #  `CREATED_LINKED_ACCOUNT_COMMON_MODEL_OVERRIDE`,
      #  `CHANGED_LINKED_ACCOUNT_COMMON_MODEL_OVERRIDE`,
      #  `DELETED_LINKED_ACCOUNT_COMMON_MODEL_OVERRIDE`, `FORCED_LINKED_ACCOUNT_RESYNC`,
      #  `MUTED_ISSUE`, `GENERATED_MAGIC_LINK`, `ENABLED_MERGE_WEBHOOK`,
      #  `DISABLED_MERGE_WEBHOOK`, `MERGE_WEBHOOK_TARGET_CHANGED`,
      #  `END_USER_CREDENTIALS_ACCESSED`
      # @param page_size [Integer] Number of results to return per page.
      # @param start_date [String] If included, will only include audit trail events that occurred after this time
      # @param user_email [String] If provided, this will return events associated with the specified user email.
      #  Please note that the email address reflects the user's email at the time of the
      #  event, and may not be their current email.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Crm::PaginatedAuditLogEventList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.crm.audit_trail.list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def list(cursor: nil, end_date: nil, event_type: nil, page_size: nil, start_date: nil, user_email: nil,
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
              "cursor": cursor,
              "end_date": end_date,
              "event_type": event_type,
              "page_size": page_size,
              "start_date": start_date,
              "user_email": user_email
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/crm/v1/audit-trail"
          end
          Merge::Crm::PaginatedAuditLogEventList.from_json(json_object: response.body)
        end
      end
    end
  end
end
