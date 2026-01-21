# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/list_tickets_request_expand"
require_relative "types/list_tickets_request_priority"
require_relative "types/list_tickets_request_remote_fields"
require_relative "types/list_tickets_request_show_enum_origins"
require_relative "../types/paginated_ticket_list"
require_relative "../types/ticket_request"
require_relative "../types/ticket_response"
require_relative "types/retrieve_tickets_request_expand"
require_relative "types/retrieve_tickets_request_remote_fields"
require_relative "types/retrieve_tickets_request_show_enum_origins"
require_relative "../types/ticket"
require_relative "../types/patched_ticket_request"
require_relative "types/viewers_list_tickets_request_expand"
require_relative "../types/paginated_viewer_list"
require_relative "types/live_search_list_tickets_request_remote_fields"
require_relative "types/live_search_list_tickets_request_show_enum_origins"
require_relative "../types/meta_response"
require_relative "../types/paginated_remote_field_class_list"
require "async"

module Merge
  module Ticketing
    class TicketsClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Ticketing::TicketsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Ticket` objects.{/*
      #  BEGIN_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  JrXHBt9EV1R2k8Cq0VLAzrF3Kii5Wvc/Jxy3LLmBQyc23r8FlkuqfKy3aZNfHHs24//AMOqtVmvRwAA"
      #  /></Footer>{/* END_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param account_id [String] If provided, will only return tickets for this account.
      # @param assignee_ids [String] If provided, will only return tickets assigned to the assignee_ids; multiple
      #  assignee_ids can be separated by commas.
      # @param collection_ids [String] If provided, will only return tickets assigned to the collection_ids; multiple
      #  collection_ids can be separated by commas.
      # @param completed_after [DateTime] If provided, will only return tickets completed after this datetime.
      # @param completed_before [DateTime] If provided, will only return tickets completed before this datetime.
      # @param contact_id [String] If provided, will only return tickets for this contact.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param creator_id [String] If provided, will only return tickets created by this creator_id.
      # @param creator_ids [String] If provided, will only return tickets created by the creator_ids; multiple
      #  creator_ids can be separated by commas.
      # @param cursor [String] The pagination cursor value.
      # @param due_after [DateTime] If provided, will only return tickets due after this datetime.
      # @param due_before [DateTime] If provided, will only return tickets due before this datetime.
      # @param expand [Merge::Ticketing::Tickets::ListTicketsRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param name [String] If provided, will only return tickets with this name.
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param parent_ticket_id [String] If provided, will only return sub tickets of the parent_ticket_id.
      # @param priority [Merge::Ticketing::Tickets::ListTicketsRequestPriority] If provided, will only return tickets of this priority.
      #  * `URGENT` - URGENT
      #  * `HIGH` - HIGH
      #  * `NORMAL` - NORMAL
      #  * `LOW` - LOW
      # @param remote_created_after [DateTime] If provided, will only return tickets created in the third party platform after
      #  this datetime.
      # @param remote_created_before [DateTime] If provided, will only return tickets created in the third party platform before
      #  this datetime.
      # @param remote_fields [Merge::Ticketing::Tickets::ListTicketsRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param remote_ids [String] If provided, will only return tickets with these remote IDs (comma-separated).
      # @param remote_updated_after [DateTime] If provided, will only return tickets updated in the third party platform after
      #  this datetime.
      # @param remote_updated_before [DateTime] If provided, will only return tickets updated in the third party platform before
      #  this datetime.
      # @param show_enum_origins [Merge::Ticketing::Tickets::ListTicketsRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param status [String] If provided, will only return tickets of this status.
      # @param tags [String] If provided, will only return tickets matching the tags; multiple tags can be
      #  separated by commas.
      # @param ticket_type [String] If provided, will only return tickets of this type.
      # @param ticket_url [String] If provided, will only return tickets where the URL matches or contains the
      #  substring
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::PaginatedTicketList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.tickets.list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def list(account_id: nil, assignee_ids: nil, collection_ids: nil, completed_after: nil, completed_before: nil,
               contact_id: nil, created_after: nil, created_before: nil, creator_id: nil, creator_ids: nil, cursor: nil, due_after: nil, due_before: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, include_remote_fields: nil, include_shell_data: nil, modified_after: nil, modified_before: nil, name: nil, page_size: nil, parent_ticket_id: nil, priority: nil, remote_created_after: nil, remote_created_before: nil, remote_fields: nil, remote_id: nil, remote_ids: nil, remote_updated_after: nil, remote_updated_before: nil, show_enum_origins: nil, status: nil, tags: nil, ticket_type: nil, ticket_url: nil, request_options: nil)
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
            "account_id": account_id,
            "assignee_ids": assignee_ids,
            "collection_ids": collection_ids,
            "completed_after": completed_after,
            "completed_before": completed_before,
            "contact_id": contact_id,
            "created_after": created_after,
            "created_before": created_before,
            "creator_id": creator_id,
            "creator_ids": creator_ids,
            "cursor": cursor,
            "due_after": due_after,
            "due_before": due_before,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_remote_fields": include_remote_fields,
            "include_shell_data": include_shell_data,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "name": name,
            "page_size": page_size,
            "parent_ticket_id": parent_ticket_id,
            "priority": priority,
            "remote_created_after": remote_created_after,
            "remote_created_before": remote_created_before,
            "remote_fields": remote_fields,
            "remote_id": remote_id,
            "remote_ids": remote_ids,
            "remote_updated_after": remote_updated_after,
            "remote_updated_before": remote_updated_before,
            "show_enum_origins": show_enum_origins,
            "status": status,
            "tags": tags,
            "ticket_type": ticket_type,
            "ticket_url": ticket_url
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets"
        end
        Merge::Ticketing::PaginatedTicketList.from_json(json_object: response.body)
      end

      # Creates a `Ticket` object with the given values.{/*
      #  BEGIN_TICKETING_TICKET_CREATE_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="POST"
      #  staK/zgbgfOCGRvrZpyzZi9ajmn9vJXAhvJnZc8Jr614x6LBugu6hhaZ/0TJ3t+/v4fL2+460c/AAA="
      #  /></Footer>{/* END_TICKETING_TICKET_CREATE_SUPPORTED_FIELDS * /}
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Ticketing::TicketRequest, as a Hash
      #   * :name (String)
      #   * :assignees (Array<String>)
      #   * :assigned_teams (Array<String>)
      #   * :creator (String)
      #   * :due_date (DateTime)
      #   * :status (Merge::Ticketing::TicketStatusEnum)
      #   * :description (String)
      #   * :collections (Array<String>)
      #   * :ticket_type (String)
      #   * :account (String)
      #   * :contact (String)
      #   * :parent_ticket (String)
      #   * :attachments (Array<String>)
      #   * :access_level (Merge::Ticketing::TicketAccessLevelEnum)
      #   * :tags (Array<String>)
      #   * :roles (Array<String>)
      #   * :ticket_url (String)
      #   * :priority (Merge::Ticketing::PriorityEnum)
      #   * :completed_at (DateTime)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      #   * :remote_fields (Array<Merge::Ticketing::RemoteFieldRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::TicketResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.tickets.create(model: {  })
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
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets"
        end
        Merge::Ticketing::TicketResponse.from_json(json_object: response.body)
      end

      # Returns a `Ticket` object with the given `id`.{/*
      #  BEGIN_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  JrXHBt9EV1R2k8Cq0VLAzrF3Kii5Wvc/Jxy3LLmBQyc23r8FlkuqfKy3aZNfHHs24//AMOqtVmvRwAA"
      #  /></Footer>{/* END_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param id [String]
      # @param expand [Merge::Ticketing::Tickets::RetrieveTicketsRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param remote_fields [Merge::Ticketing::Tickets::RetrieveTicketsRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [Merge::Ticketing::Tickets::RetrieveTicketsRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::Ticket]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.tickets.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, include_remote_fields: nil, include_shell_data: nil,
                   remote_fields: nil, show_enum_origins: nil, request_options: nil)
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
            "include_remote_fields": include_remote_fields,
            "include_shell_data": include_shell_data,
            "remote_fields": remote_fields,
            "show_enum_origins": show_enum_origins
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/#{id}"
        end
        Merge::Ticketing::Ticket.from_json(json_object: response.body)
      end

      # Updates a `Ticket` object with the given `id`.{/*
      #  BEGIN_TICKETING_TICKET_EDIT_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="EDIT"
      #  DyV+k1OHrZZvlbW+xuvZW9W2P+Lob0zvedKZCRKDx+a8Td+vOtd+Yos9+tP8u5+/gd1WS+iTx4AAA=="
      #  /></Footer>{/* END_TICKETING_TICKET_EDIT_SUPPORTED_FIELDS * /}
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Ticketing::PatchedTicketRequest, as a Hash
      #   * :name (String)
      #   * :assignees (Array<String>)
      #   * :assigned_teams (Array<String>)
      #   * :creator (String)
      #   * :due_date (DateTime)
      #   * :status (Merge::Ticketing::TicketStatusEnum)
      #   * :description (String)
      #   * :collections (Array<String>)
      #   * :ticket_type (String)
      #   * :account (String)
      #   * :contact (String)
      #   * :parent_ticket (String)
      #   * :access_level (Merge::Ticketing::TicketAccessLevelEnum)
      #   * :tags (Array<String>)
      #   * :roles (Array<String>)
      #   * :ticket_url (String)
      #   * :priority (Merge::Ticketing::PriorityEnum)
      #   * :completed_at (DateTime)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      #   * :remote_fields (Array<Merge::Ticketing::RemoteFieldRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::TicketResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.tickets.partial_update(id: "id", model: {  })
      def partial_update(id:, model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.patch do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/#{id}"
        end
        Merge::Ticketing::TicketResponse.from_json(json_object: response.body)
      end

      # Returns a list of `Viewer` objects that point to a User id or Team id that is
      #  either an assignee or viewer on a `Ticket` with the given id. [Learn
      #  tps://help.merge.dev/en/articles/10333658-ticketing-access-control-list-acls){/*
      #  BEGIN_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  JrXHBt9EV1R2k8Cq0VLAzrF3Kii5Wvc/Jxy3LLmBQyc23r8FlkuqfKy3aZNfHHs24//AMOqtVmvRwAA"
      #  /></Footer>{/* END_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param ticket_id [String]
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Ticketing::Tickets::ViewersListTicketsRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::PaginatedViewerList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.tickets.viewers_list(ticket_id: "ticket_id", cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def viewers_list(ticket_id:, cursor: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil,
                       include_shell_data: nil, page_size: nil, request_options: nil)
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
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_shell_data": include_shell_data,
            "page_size": page_size
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/#{ticket_id}/viewers"
        end
        Merge::Ticketing::PaginatedViewerList.from_json(json_object: response.body)
      end

      # Returns a list of `Ticket` objects.{/*
      #  BEGIN_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  JrXHBt9EV1R2k8Cq0VLAzrF3Kii5Wvc/Jxy3LLmBQyc23r8FlkuqfKy3aZNfHHs24//AMOqtVmvRwAA"
      #  /></Footer>{/* END_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param assignee_ids [String] Filter tickets by assignee IDs (comma-separated)
      # @param assignees [String] Filter tickets by assignee names (comma-separated)
      # @param collection_ids [String] Filter tickets by collection IDs (comma-separated)
      # @param collections [String] Filter tickets by collection names (comma-separated)
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param name [String] Filter tickets by name/title
      # @param remote_cursor [String] Pagination cursor for remote data
      # @param remote_fields [Merge::Ticketing::Tickets::LiveSearchListTicketsRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [Merge::Ticketing::Tickets::LiveSearchListTicketsRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param status [String] Filter tickets by status
      # @param ticket_url [String] Filter tickets by URL
      # @param request_options [Merge::RequestOptions]
      # @yield on_data[chunk, overall_received_bytes, env] Leverage the Faraday on_data callback which
      #  will receive tuples of strings, the sum of characters received so far, and the
      #  response environment. The latter will allow access to the response status,
      #  headers and reason, as well as the request info.
      # @return [Void]
      def live_search_list(assignee_ids: nil, assignees: nil, collection_ids: nil, collections: nil,
                           include_deleted_data: nil, include_remote_fields: nil, include_shell_data: nil, name: nil, remote_cursor: nil, remote_fields: nil, show_enum_origins: nil, status: nil, ticket_url: nil, request_options: nil, &on_data)
        @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.options.on_data = on_data
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "assignee_ids": assignee_ids,
            "assignees": assignees,
            "collection_ids": collection_ids,
            "collections": collections,
            "include_deleted_data": include_deleted_data,
            "include_remote_fields": include_remote_fields,
            "include_shell_data": include_shell_data,
            "name": name,
            "remote_cursor": remote_cursor,
            "remote_fields": remote_fields,
            "show_enum_origins": show_enum_origins,
            "status": status,
            "ticket_url": ticket_url
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/live-search"
        end
      end

      # Returns metadata for `Ticket` PATCHs.{/*
      #  BEGIN_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  JrXHBt9EV1R2k8Cq0VLAzrF3Kii5Wvc/Jxy3LLmBQyc23r8FlkuqfKy3aZNfHHs24//AMOqtVmvRwAA"
      #  /></Footer>{/* END_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.tickets.meta_patch_retrieve(id: "id")
      def meta_patch_retrieve(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/meta/patch/#{id}"
        end
        Merge::Ticketing::MetaResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `Ticket` POSTs.{/*
      #  BEGIN_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  JrXHBt9EV1R2k8Cq0VLAzrF3Kii5Wvc/Jxy3LLmBQyc23r8FlkuqfKy3aZNfHHs24//AMOqtVmvRwAA"
      #  /></Footer>{/* END_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param collection_id [String] If provided, will only return tickets for this collection.
      # @param ticket_type [String] If provided, will only return tickets for this ticket type.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.tickets.meta_post_retrieve
      def meta_post_retrieve(collection_id: nil, ticket_type: nil, request_options: nil)
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
            "collection_id": collection_id,
            "ticket_type": ticket_type
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/meta/post"
        end
        Merge::Ticketing::MetaResponse.from_json(json_object: response.body)
      end

      # Returns a list of `RemoteFieldClass` objects.{/*
      #  BEGIN_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  JrXHBt9EV1R2k8Cq0VLAzrF3Kii5Wvc/Jxy3LLmBQyc23r8FlkuqfKy3aZNfHHs24//AMOqtVmvRwAA"
      #  /></Footer>{/* END_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param cursor [String] The pagination cursor value.
      # @param ids [String] If provided, will only return remote field classes with the `ids` in this list
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param is_common_model_field [Boolean] If provided, will only return remote field classes with this
      #  is_common_model_field value
      # @param is_custom [Boolean] If provided, will only return remote fields classes with this is_custom value
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::PaginatedRemoteFieldClassList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.tickets.remote_field_classes_list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def remote_field_classes_list(cursor: nil, ids: nil, include_deleted_data: nil, include_remote_data: nil,
                                    include_shell_data: nil, is_common_model_field: nil, is_custom: nil, page_size: nil, request_options: nil)
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
            "ids": ids,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_shell_data": include_shell_data,
            "is_common_model_field": is_common_model_field,
            "is_custom": is_custom,
            "page_size": page_size
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/remote-field-classes"
        end
        Merge::Ticketing::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
      end
    end

    class AsyncTicketsClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Ticketing::AsyncTicketsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Ticket` objects.{/*
      #  BEGIN_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  JrXHBt9EV1R2k8Cq0VLAzrF3Kii5Wvc/Jxy3LLmBQyc23r8FlkuqfKy3aZNfHHs24//AMOqtVmvRwAA"
      #  /></Footer>{/* END_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param account_id [String] If provided, will only return tickets for this account.
      # @param assignee_ids [String] If provided, will only return tickets assigned to the assignee_ids; multiple
      #  assignee_ids can be separated by commas.
      # @param collection_ids [String] If provided, will only return tickets assigned to the collection_ids; multiple
      #  collection_ids can be separated by commas.
      # @param completed_after [DateTime] If provided, will only return tickets completed after this datetime.
      # @param completed_before [DateTime] If provided, will only return tickets completed before this datetime.
      # @param contact_id [String] If provided, will only return tickets for this contact.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param creator_id [String] If provided, will only return tickets created by this creator_id.
      # @param creator_ids [String] If provided, will only return tickets created by the creator_ids; multiple
      #  creator_ids can be separated by commas.
      # @param cursor [String] The pagination cursor value.
      # @param due_after [DateTime] If provided, will only return tickets due after this datetime.
      # @param due_before [DateTime] If provided, will only return tickets due before this datetime.
      # @param expand [Merge::Ticketing::Tickets::ListTicketsRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param name [String] If provided, will only return tickets with this name.
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param parent_ticket_id [String] If provided, will only return sub tickets of the parent_ticket_id.
      # @param priority [Merge::Ticketing::Tickets::ListTicketsRequestPriority] If provided, will only return tickets of this priority.
      #  * `URGENT` - URGENT
      #  * `HIGH` - HIGH
      #  * `NORMAL` - NORMAL
      #  * `LOW` - LOW
      # @param remote_created_after [DateTime] If provided, will only return tickets created in the third party platform after
      #  this datetime.
      # @param remote_created_before [DateTime] If provided, will only return tickets created in the third party platform before
      #  this datetime.
      # @param remote_fields [Merge::Ticketing::Tickets::ListTicketsRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param remote_ids [String] If provided, will only return tickets with these remote IDs (comma-separated).
      # @param remote_updated_after [DateTime] If provided, will only return tickets updated in the third party platform after
      #  this datetime.
      # @param remote_updated_before [DateTime] If provided, will only return tickets updated in the third party platform before
      #  this datetime.
      # @param show_enum_origins [Merge::Ticketing::Tickets::ListTicketsRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param status [String] If provided, will only return tickets of this status.
      # @param tags [String] If provided, will only return tickets matching the tags; multiple tags can be
      #  separated by commas.
      # @param ticket_type [String] If provided, will only return tickets of this type.
      # @param ticket_url [String] If provided, will only return tickets where the URL matches or contains the
      #  substring
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::PaginatedTicketList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.tickets.list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def list(account_id: nil, assignee_ids: nil, collection_ids: nil, completed_after: nil, completed_before: nil,
               contact_id: nil, created_after: nil, created_before: nil, creator_id: nil, creator_ids: nil, cursor: nil, due_after: nil, due_before: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, include_remote_fields: nil, include_shell_data: nil, modified_after: nil, modified_before: nil, name: nil, page_size: nil, parent_ticket_id: nil, priority: nil, remote_created_after: nil, remote_created_before: nil, remote_fields: nil, remote_id: nil, remote_ids: nil, remote_updated_after: nil, remote_updated_before: nil, show_enum_origins: nil, status: nil, tags: nil, ticket_type: nil, ticket_url: nil, request_options: nil)
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
              "account_id": account_id,
              "assignee_ids": assignee_ids,
              "collection_ids": collection_ids,
              "completed_after": completed_after,
              "completed_before": completed_before,
              "contact_id": contact_id,
              "created_after": created_after,
              "created_before": created_before,
              "creator_id": creator_id,
              "creator_ids": creator_ids,
              "cursor": cursor,
              "due_after": due_after,
              "due_before": due_before,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_remote_fields": include_remote_fields,
              "include_shell_data": include_shell_data,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "name": name,
              "page_size": page_size,
              "parent_ticket_id": parent_ticket_id,
              "priority": priority,
              "remote_created_after": remote_created_after,
              "remote_created_before": remote_created_before,
              "remote_fields": remote_fields,
              "remote_id": remote_id,
              "remote_ids": remote_ids,
              "remote_updated_after": remote_updated_after,
              "remote_updated_before": remote_updated_before,
              "show_enum_origins": show_enum_origins,
              "status": status,
              "tags": tags,
              "ticket_type": ticket_type,
              "ticket_url": ticket_url
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets"
          end
          Merge::Ticketing::PaginatedTicketList.from_json(json_object: response.body)
        end
      end

      # Creates a `Ticket` object with the given values.{/*
      #  BEGIN_TICKETING_TICKET_CREATE_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="POST"
      #  staK/zgbgfOCGRvrZpyzZi9ajmn9vJXAhvJnZc8Jr614x6LBugu6hhaZ/0TJ3t+/v4fL2+460c/AAA="
      #  /></Footer>{/* END_TICKETING_TICKET_CREATE_SUPPORTED_FIELDS * /}
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Ticketing::TicketRequest, as a Hash
      #   * :name (String)
      #   * :assignees (Array<String>)
      #   * :assigned_teams (Array<String>)
      #   * :creator (String)
      #   * :due_date (DateTime)
      #   * :status (Merge::Ticketing::TicketStatusEnum)
      #   * :description (String)
      #   * :collections (Array<String>)
      #   * :ticket_type (String)
      #   * :account (String)
      #   * :contact (String)
      #   * :parent_ticket (String)
      #   * :attachments (Array<String>)
      #   * :access_level (Merge::Ticketing::TicketAccessLevelEnum)
      #   * :tags (Array<String>)
      #   * :roles (Array<String>)
      #   * :ticket_url (String)
      #   * :priority (Merge::Ticketing::PriorityEnum)
      #   * :completed_at (DateTime)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      #   * :remote_fields (Array<Merge::Ticketing::RemoteFieldRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::TicketResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.tickets.create(model: {  })
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
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets"
          end
          Merge::Ticketing::TicketResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `Ticket` object with the given `id`.{/*
      #  BEGIN_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  JrXHBt9EV1R2k8Cq0VLAzrF3Kii5Wvc/Jxy3LLmBQyc23r8FlkuqfKy3aZNfHHs24//AMOqtVmvRwAA"
      #  /></Footer>{/* END_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param id [String]
      # @param expand [Merge::Ticketing::Tickets::RetrieveTicketsRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param remote_fields [Merge::Ticketing::Tickets::RetrieveTicketsRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [Merge::Ticketing::Tickets::RetrieveTicketsRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::Ticket]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.tickets.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, include_remote_fields: nil, include_shell_data: nil,
                   remote_fields: nil, show_enum_origins: nil, request_options: nil)
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
              "include_remote_fields": include_remote_fields,
              "include_shell_data": include_shell_data,
              "remote_fields": remote_fields,
              "show_enum_origins": show_enum_origins
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/#{id}"
          end
          Merge::Ticketing::Ticket.from_json(json_object: response.body)
        end
      end

      # Updates a `Ticket` object with the given `id`.{/*
      #  BEGIN_TICKETING_TICKET_EDIT_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="EDIT"
      #  DyV+k1OHrZZvlbW+xuvZW9W2P+Lob0zvedKZCRKDx+a8Td+vOtd+Yos9+tP8u5+/gd1WS+iTx4AAA=="
      #  /></Footer>{/* END_TICKETING_TICKET_EDIT_SUPPORTED_FIELDS * /}
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Ticketing::PatchedTicketRequest, as a Hash
      #   * :name (String)
      #   * :assignees (Array<String>)
      #   * :assigned_teams (Array<String>)
      #   * :creator (String)
      #   * :due_date (DateTime)
      #   * :status (Merge::Ticketing::TicketStatusEnum)
      #   * :description (String)
      #   * :collections (Array<String>)
      #   * :ticket_type (String)
      #   * :account (String)
      #   * :contact (String)
      #   * :parent_ticket (String)
      #   * :access_level (Merge::Ticketing::TicketAccessLevelEnum)
      #   * :tags (Array<String>)
      #   * :roles (Array<String>)
      #   * :ticket_url (String)
      #   * :priority (Merge::Ticketing::PriorityEnum)
      #   * :completed_at (DateTime)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      #   * :remote_fields (Array<Merge::Ticketing::RemoteFieldRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::TicketResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.tickets.partial_update(id: "id", model: {  })
      def partial_update(id:, model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.patch do |req|
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
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/#{id}"
          end
          Merge::Ticketing::TicketResponse.from_json(json_object: response.body)
        end
      end

      # Returns a list of `Viewer` objects that point to a User id or Team id that is
      #  either an assignee or viewer on a `Ticket` with the given id. [Learn
      #  tps://help.merge.dev/en/articles/10333658-ticketing-access-control-list-acls){/*
      #  BEGIN_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  JrXHBt9EV1R2k8Cq0VLAzrF3Kii5Wvc/Jxy3LLmBQyc23r8FlkuqfKy3aZNfHHs24//AMOqtVmvRwAA"
      #  /></Footer>{/* END_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param ticket_id [String]
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Ticketing::Tickets::ViewersListTicketsRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::PaginatedViewerList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.tickets.viewers_list(ticket_id: "ticket_id", cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def viewers_list(ticket_id:, cursor: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil,
                       include_shell_data: nil, page_size: nil, request_options: nil)
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
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_shell_data": include_shell_data,
              "page_size": page_size
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/#{ticket_id}/viewers"
          end
          Merge::Ticketing::PaginatedViewerList.from_json(json_object: response.body)
        end
      end

      # Returns a list of `Ticket` objects.{/*
      #  BEGIN_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  JrXHBt9EV1R2k8Cq0VLAzrF3Kii5Wvc/Jxy3LLmBQyc23r8FlkuqfKy3aZNfHHs24//AMOqtVmvRwAA"
      #  /></Footer>{/* END_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param assignee_ids [String] Filter tickets by assignee IDs (comma-separated)
      # @param assignees [String] Filter tickets by assignee names (comma-separated)
      # @param collection_ids [String] Filter tickets by collection IDs (comma-separated)
      # @param collections [String] Filter tickets by collection names (comma-separated)
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param name [String] Filter tickets by name/title
      # @param remote_cursor [String] Pagination cursor for remote data
      # @param remote_fields [Merge::Ticketing::Tickets::LiveSearchListTicketsRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [Merge::Ticketing::Tickets::LiveSearchListTicketsRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param status [String] Filter tickets by status
      # @param ticket_url [String] Filter tickets by URL
      # @param request_options [Merge::RequestOptions]
      # @yield on_data[chunk, overall_received_bytes, env] Leverage the Faraday on_data callback which
      #  will receive tuples of strings, the sum of characters received so far, and the
      #  response environment. The latter will allow access to the response status,
      #  headers and reason, as well as the request info.
      # @return [Void]
      def live_search_list(assignee_ids: nil, assignees: nil, collection_ids: nil, collections: nil,
                           include_deleted_data: nil, include_remote_fields: nil, include_shell_data: nil, name: nil, remote_cursor: nil, remote_fields: nil, show_enum_origins: nil, status: nil, ticket_url: nil, request_options: nil, &on_data)
        Async do
          @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.options.on_data = on_data
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "assignee_ids": assignee_ids,
              "assignees": assignees,
              "collection_ids": collection_ids,
              "collections": collections,
              "include_deleted_data": include_deleted_data,
              "include_remote_fields": include_remote_fields,
              "include_shell_data": include_shell_data,
              "name": name,
              "remote_cursor": remote_cursor,
              "remote_fields": remote_fields,
              "show_enum_origins": show_enum_origins,
              "status": status,
              "ticket_url": ticket_url
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/live-search"
          end
        end
      end

      # Returns metadata for `Ticket` PATCHs.{/*
      #  BEGIN_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  JrXHBt9EV1R2k8Cq0VLAzrF3Kii5Wvc/Jxy3LLmBQyc23r8FlkuqfKy3aZNfHHs24//AMOqtVmvRwAA"
      #  /></Footer>{/* END_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.tickets.meta_patch_retrieve(id: "id")
      def meta_patch_retrieve(id:, request_options: nil)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/meta/patch/#{id}"
          end
          Merge::Ticketing::MetaResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Ticket` POSTs.{/*
      #  BEGIN_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  JrXHBt9EV1R2k8Cq0VLAzrF3Kii5Wvc/Jxy3LLmBQyc23r8FlkuqfKy3aZNfHHs24//AMOqtVmvRwAA"
      #  /></Footer>{/* END_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param collection_id [String] If provided, will only return tickets for this collection.
      # @param ticket_type [String] If provided, will only return tickets for this ticket type.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.tickets.meta_post_retrieve
      def meta_post_retrieve(collection_id: nil, ticket_type: nil, request_options: nil)
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
              "collection_id": collection_id,
              "ticket_type": ticket_type
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/meta/post"
          end
          Merge::Ticketing::MetaResponse.from_json(json_object: response.body)
        end
      end

      # Returns a list of `RemoteFieldClass` objects.{/*
      #  BEGIN_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  JrXHBt9EV1R2k8Cq0VLAzrF3Kii5Wvc/Jxy3LLmBQyc23r8FlkuqfKy3aZNfHHs24//AMOqtVmvRwAA"
      #  /></Footer>{/* END_TICKETING_TICKET_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param cursor [String] The pagination cursor value.
      # @param ids [String] If provided, will only return remote field classes with the `ids` in this list
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param is_common_model_field [Boolean] If provided, will only return remote field classes with this
      #  is_common_model_field value
      # @param is_custom [Boolean] If provided, will only return remote fields classes with this is_custom value
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::PaginatedRemoteFieldClassList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.tickets.remote_field_classes_list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def remote_field_classes_list(cursor: nil, ids: nil, include_deleted_data: nil, include_remote_data: nil,
                                    include_shell_data: nil, is_common_model_field: nil, is_custom: nil, page_size: nil, request_options: nil)
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
              "ids": ids,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_shell_data": include_shell_data,
              "is_common_model_field": is_common_model_field,
              "is_custom": is_custom,
              "page_size": page_size
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/remote-field-classes"
          end
          Merge::Ticketing::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
        end
      end
    end
  end
end
