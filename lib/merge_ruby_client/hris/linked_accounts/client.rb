# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/linked_accounts_list_request_category"
require_relative "../types/paginated_account_details_and_actions_list"
require "async"

module Merge
  module Hris
    class LinkedAccountsClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Hris::LinkedAccountsClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # List linked accounts for your organization.
      #
      # @param category [LINKED_ACCOUNTS_LIST_REQUEST_CATEGORY] Options: ('hris', 'ats', 'accounting', 'ticketing', 'crm', 'mktg', 'filestorage')
      #   - `hris` - hris
      #   - `ats` - ats
      #   - `accounting` - accounting
      #   - `ticketing` - ticketing
      #   - `crm` - crm
      #   - `mktg` - mktg
      #   - `filestorage` - filestorage
      # @param cursor [String] The pagination cursor value.
      # @param end_user_email_address [String] If provided, will only return linked accounts associated with the given email address.
      # @param end_user_organization_name [String] If provided, will only return linked accounts associated with the given organization name.
      # @param end_user_origin_id [String] If provided, will only return linked accounts associated with the given origin ID.
      # @param end_user_origin_ids [String] Comma-separated list of EndUser origin IDs, making it possible to specify multiple EndUsers at once.
      # @param id [String]
      # @param ids [String] Comma-separated list of LinkedAccount IDs, making it possible to specify multiple LinkedAccounts at once.
      # @param include_duplicates [Boolean] If `true`, will include complete production duplicates of the account specified by the `id` query parameter in the response. `id` must be for a complete production linked account.
      # @param integration_name [String] If provided, will only return linked accounts associated with the given integration name.
      # @param is_test_account [String] If included, will only include test linked accounts. If not included, will only include non-test linked accounts.
      # @param page_size [Integer] Number of results to return per page.
      # @param status [String] Filter by status. Options: `COMPLETE`, `INCOMPLETE`, `RELINK_NEEDED`
      # @param request_options [RequestOptions]
      # @return [Hris::PaginatedAccountDetailsAndActionsList]
      def list(category: nil, cursor: nil, end_user_email_address: nil, end_user_organization_name: nil,
               end_user_origin_id: nil, end_user_origin_ids: nil, id: nil, ids: nil, include_duplicates: nil, integration_name: nil, is_test_account: nil, page_size: nil, status: nil, request_options: nil)
        response = @request_client.conn.get("/api/hris/v1/linked-accounts") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "category": category,
            "cursor": cursor,
            "end_user_email_address": end_user_email_address,
            "end_user_organization_name": end_user_organization_name,
            "end_user_origin_id": end_user_origin_id,
            "end_user_origin_ids": end_user_origin_ids,
            "id": id,
            "ids": ids,
            "include_duplicates": include_duplicates,
            "integration_name": integration_name,
            "is_test_account": is_test_account,
            "page_size": page_size,
            "status": status
          }.compact
        end
        Hris::PaginatedAccountDetailsAndActionsList.from_json(json_object: response.body)
      end
    end

    class AsyncLinkedAccountsClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Hris::AsyncLinkedAccountsClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # List linked accounts for your organization.
      #
      # @param category [LINKED_ACCOUNTS_LIST_REQUEST_CATEGORY] Options: ('hris', 'ats', 'accounting', 'ticketing', 'crm', 'mktg', 'filestorage')
      #   - `hris` - hris
      #   - `ats` - ats
      #   - `accounting` - accounting
      #   - `ticketing` - ticketing
      #   - `crm` - crm
      #   - `mktg` - mktg
      #   - `filestorage` - filestorage
      # @param cursor [String] The pagination cursor value.
      # @param end_user_email_address [String] If provided, will only return linked accounts associated with the given email address.
      # @param end_user_organization_name [String] If provided, will only return linked accounts associated with the given organization name.
      # @param end_user_origin_id [String] If provided, will only return linked accounts associated with the given origin ID.
      # @param end_user_origin_ids [String] Comma-separated list of EndUser origin IDs, making it possible to specify multiple EndUsers at once.
      # @param id [String]
      # @param ids [String] Comma-separated list of LinkedAccount IDs, making it possible to specify multiple LinkedAccounts at once.
      # @param include_duplicates [Boolean] If `true`, will include complete production duplicates of the account specified by the `id` query parameter in the response. `id` must be for a complete production linked account.
      # @param integration_name [String] If provided, will only return linked accounts associated with the given integration name.
      # @param is_test_account [String] If included, will only include test linked accounts. If not included, will only include non-test linked accounts.
      # @param page_size [Integer] Number of results to return per page.
      # @param status [String] Filter by status. Options: `COMPLETE`, `INCOMPLETE`, `RELINK_NEEDED`
      # @param request_options [RequestOptions]
      # @return [Hris::PaginatedAccountDetailsAndActionsList]
      def list(category: nil, cursor: nil, end_user_email_address: nil, end_user_organization_name: nil,
               end_user_origin_id: nil, end_user_origin_ids: nil, id: nil, ids: nil, include_duplicates: nil, integration_name: nil, is_test_account: nil, page_size: nil, status: nil, request_options: nil)
        Async do
          response = @request_client.conn.get("/api/hris/v1/linked-accounts") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "category": category,
              "cursor": cursor,
              "end_user_email_address": end_user_email_address,
              "end_user_organization_name": end_user_organization_name,
              "end_user_origin_id": end_user_origin_id,
              "end_user_origin_ids": end_user_origin_ids,
              "id": id,
              "ids": ids,
              "include_duplicates": include_duplicates,
              "integration_name": integration_name,
              "is_test_account": is_test_account,
              "page_size": page_size,
              "status": status
            }.compact
          end
          Hris::PaginatedAccountDetailsAndActionsList.from_json(json_object: response.body)
        end
      end
    end
  end
end
