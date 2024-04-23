# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/tickets_list_request_expand"
require_relative "types/tickets_list_request_priority"
require_relative "types/tickets_list_request_remote_fields"
require_relative "types/tickets_list_request_show_enum_origins"
require_relative "types/tickets_list_request_status"
require_relative "../types/paginated_ticket_list"
require_relative "../types/ticket_request"
require_relative "../types/ticket_response"
require_relative "types/tickets_retrieve_request_expand"
require_relative "types/tickets_retrieve_request_remote_fields"
require_relative "types/tickets_retrieve_request_show_enum_origins"
require_relative "../types/ticket"
require_relative "../types/patched_ticket_request"
require_relative "types/tickets_collaborators_list_request_expand"
require_relative "../types/paginated_user_list"
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

      # Returns a list of `Ticket` objects.
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
      # @param cursor [String] The pagination cursor value.
      # @param due_after [DateTime] If provided, will only return tickets due after this datetime.
      # @param due_before [DateTime] If provided, will only return tickets due before this datetime.
      # @param expand [Merge::Ticketing::Tickets::TicketsListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param parent_ticket_id [String] If provided, will only return sub tickets of the parent_ticket_id.
      # @param priority [Merge::Ticketing::Tickets::TicketsListRequestPriority] If provided, will only return tickets of this priority.
      #  - `URGENT` - URGENT
      #  - `HIGH` - HIGH
      #  - `NORMAL` - NORMAL
      #  - `LOW` - LOW
      # @param remote_created_after [DateTime] If provided, will only return tickets created in the third party platform after
      #  this datetime.
      # @param remote_created_before [DateTime] If provided, will only return tickets created in the third party platform before
      #  this datetime.
      # @param remote_fields [Merge::Ticketing::Tickets::TicketsListRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param remote_updated_after [DateTime] If provided, will only return tickets updated in the third party platform after
      #  this datetime.
      # @param remote_updated_before [DateTime] If provided, will only return tickets updated in the third party platform before
      #  this datetime.
      # @param show_enum_origins [Merge::Ticketing::Tickets::TicketsListRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param status [Merge::Ticketing::Tickets::TicketsListRequestStatus] If provided, will only return tickets of this status.
      #  - `OPEN` - OPEN
      #  - `CLOSED` - CLOSED
      #  - `IN_PROGRESS` - IN_PROGRESS
      #  - `ON_HOLD` - ON_HOLD
      # @param tags [String] If provided, will only return tickets matching the tags; multiple tags can be
      #  separated by commas.
      # @param ticket_type [String] If provided, will only return tickets of this type.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::PaginatedTicketList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.list
      def list(account_id: nil, assignee_ids: nil, collection_ids: nil, completed_after: nil, completed_before: nil,
               contact_id: nil, created_after: nil, created_before: nil, cursor: nil, due_after: nil, due_before: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, include_remote_fields: nil, modified_after: nil, modified_before: nil, page_size: nil, parent_ticket_id: nil, priority: nil, remote_created_after: nil, remote_created_before: nil, remote_fields: nil, remote_id: nil, remote_updated_after: nil, remote_updated_before: nil, show_enum_origins: nil, status: nil, tags: nil, ticket_type: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
            "cursor": cursor,
            "due_after": due_after,
            "due_before": due_before,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_remote_fields": include_remote_fields,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "page_size": page_size,
            "parent_ticket_id": parent_ticket_id,
            "priority": priority,
            "remote_created_after": remote_created_after,
            "remote_created_before": remote_created_before,
            "remote_fields": remote_fields,
            "remote_id": remote_id,
            "remote_updated_after": remote_updated_after,
            "remote_updated_before": remote_updated_before,
            "show_enum_origins": show_enum_origins,
            "status": status,
            "tags": tags,
            "ticket_type": ticket_type
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets"
        end
        Merge::Ticketing::PaginatedTicketList.from_json(json_object: response.body)
      end

      # Creates a `Ticket` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Ticketing::TicketRequest, as a Hash
      #   * :name (String)
      #   * :assignees (Array<Merge::Ticketing::TicketRequestAssigneesItem>)
      #   * :creator (Hash)
      #   * :due_date (DateTime)
      #   * :status (Merge::Ticketing::TicketStatusEnum)
      #   * :description (String)
      #   * :collections (Array<Merge::Ticketing::TicketRequestCollectionsItem>)
      #   * :ticket_type (String)
      #   * :account (Hash)
      #   * :contact (Hash)
      #   * :parent_ticket (Hash)
      #   * :attachments (Array<Merge::Ticketing::TicketRequestAttachmentsItem>)
      #   * :tags (Array<String>)
      #   * :completed_at (DateTime)
      #   * :ticket_url (String)
      #   * :priority (Merge::Ticketing::PriorityEnum)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      #   * :remote_fields (Array<Merge::Ticketing::RemoteFieldRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::TicketResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.create(model: {  })
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.post do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets"
        end
        Merge::Ticketing::TicketResponse.from_json(json_object: response.body)
      end

      # Returns a `Ticket` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Ticketing::Tickets::TicketsRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param remote_fields [Merge::Ticketing::Tickets::TicketsRetrieveRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [Merge::Ticketing::Tickets::TicketsRetrieveRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::Ticket]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, include_remote_fields: nil, remote_fields: nil,
                   show_enum_origins: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "expand": expand,
            "include_remote_data": include_remote_data,
            "include_remote_fields": include_remote_fields,
            "remote_fields": remote_fields,
            "show_enum_origins": show_enum_origins
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/#{id}"
        end
        Merge::Ticketing::Ticket.from_json(json_object: response.body)
      end

      # Updates a `Ticket` object with the given `id`.
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Ticketing::PatchedTicketRequest, as a Hash
      #   * :name (String)
      #   * :assignees (Array<String>)
      #   * :creator (String)
      #   * :due_date (DateTime)
      #   * :status (Merge::Ticketing::TicketStatusEnum)
      #   * :description (String)
      #   * :collections (Array<String>)
      #   * :ticket_type (String)
      #   * :account (String)
      #   * :contact (String)
      #   * :parent_ticket (String)
      #   * :tags (Array<String>)
      #   * :completed_at (DateTime)
      #   * :ticket_url (String)
      #   * :priority (Merge::Ticketing::PriorityEnum)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      #   * :remote_fields (Array<Merge::Ticketing::RemoteFieldRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::TicketResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.partial_update(id: "id", model: {  })
      def partial_update(id:, model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.patch do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/#{id}"
        end
        Merge::Ticketing::TicketResponse.from_json(json_object: response.body)
      end

      # Returns a list of `User` objects.
      #
      # @param parent_id [String]
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Ticketing::Tickets::TicketsCollaboratorsListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::PaginatedUserList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.collaborators_list(parent_id: "parent_id")
      def collaborators_list(parent_id:, cursor: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil,
                             page_size: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "cursor": cursor,
            "expand": expand,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "page_size": page_size
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/#{parent_id}/collaborators"
        end
        Merge::Ticketing::PaginatedUserList.from_json(json_object: response.body)
      end

      # Returns metadata for `Ticket` PATCHs.
      #
      # @param id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.meta_patch_retrieve(id: "id")
      def meta_patch_retrieve(id:, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/meta/patch/#{id}"
        end
        Merge::Ticketing::MetaResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `Ticket` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.meta_post_retrieve
      def meta_post_retrieve(request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/meta/post"
        end
        Merge::Ticketing::MetaResponse.from_json(json_object: response.body)
      end

      # Returns a list of `RemoteFieldClass` objects.
      #
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::PaginatedRemoteFieldClassList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.remote_field_classes_list
      def remote_field_classes_list(cursor: nil, include_deleted_data: nil, include_remote_data: nil, page_size: nil,
                                    request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "cursor": cursor,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "page_size": page_size
          }.compact
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

      # Returns a list of `Ticket` objects.
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
      # @param cursor [String] The pagination cursor value.
      # @param due_after [DateTime] If provided, will only return tickets due after this datetime.
      # @param due_before [DateTime] If provided, will only return tickets due before this datetime.
      # @param expand [Merge::Ticketing::Tickets::TicketsListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param parent_ticket_id [String] If provided, will only return sub tickets of the parent_ticket_id.
      # @param priority [Merge::Ticketing::Tickets::TicketsListRequestPriority] If provided, will only return tickets of this priority.
      #  - `URGENT` - URGENT
      #  - `HIGH` - HIGH
      #  - `NORMAL` - NORMAL
      #  - `LOW` - LOW
      # @param remote_created_after [DateTime] If provided, will only return tickets created in the third party platform after
      #  this datetime.
      # @param remote_created_before [DateTime] If provided, will only return tickets created in the third party platform before
      #  this datetime.
      # @param remote_fields [Merge::Ticketing::Tickets::TicketsListRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param remote_updated_after [DateTime] If provided, will only return tickets updated in the third party platform after
      #  this datetime.
      # @param remote_updated_before [DateTime] If provided, will only return tickets updated in the third party platform before
      #  this datetime.
      # @param show_enum_origins [Merge::Ticketing::Tickets::TicketsListRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param status [Merge::Ticketing::Tickets::TicketsListRequestStatus] If provided, will only return tickets of this status.
      #  - `OPEN` - OPEN
      #  - `CLOSED` - CLOSED
      #  - `IN_PROGRESS` - IN_PROGRESS
      #  - `ON_HOLD` - ON_HOLD
      # @param tags [String] If provided, will only return tickets matching the tags; multiple tags can be
      #  separated by commas.
      # @param ticket_type [String] If provided, will only return tickets of this type.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::PaginatedTicketList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.list
      def list(account_id: nil, assignee_ids: nil, collection_ids: nil, completed_after: nil, completed_before: nil,
               contact_id: nil, created_after: nil, created_before: nil, cursor: nil, due_after: nil, due_before: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil, include_remote_fields: nil, modified_after: nil, modified_before: nil, page_size: nil, parent_ticket_id: nil, priority: nil, remote_created_after: nil, remote_created_before: nil, remote_fields: nil, remote_id: nil, remote_updated_after: nil, remote_updated_before: nil, show_enum_origins: nil, status: nil, tags: nil, ticket_type: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
              "cursor": cursor,
              "due_after": due_after,
              "due_before": due_before,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_remote_fields": include_remote_fields,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "page_size": page_size,
              "parent_ticket_id": parent_ticket_id,
              "priority": priority,
              "remote_created_after": remote_created_after,
              "remote_created_before": remote_created_before,
              "remote_fields": remote_fields,
              "remote_id": remote_id,
              "remote_updated_after": remote_updated_after,
              "remote_updated_before": remote_updated_before,
              "show_enum_origins": show_enum_origins,
              "status": status,
              "tags": tags,
              "ticket_type": ticket_type
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets"
          end
          Merge::Ticketing::PaginatedTicketList.from_json(json_object: response.body)
        end
      end

      # Creates a `Ticket` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Ticketing::TicketRequest, as a Hash
      #   * :name (String)
      #   * :assignees (Array<Merge::Ticketing::TicketRequestAssigneesItem>)
      #   * :creator (Hash)
      #   * :due_date (DateTime)
      #   * :status (Merge::Ticketing::TicketStatusEnum)
      #   * :description (String)
      #   * :collections (Array<Merge::Ticketing::TicketRequestCollectionsItem>)
      #   * :ticket_type (String)
      #   * :account (Hash)
      #   * :contact (Hash)
      #   * :parent_ticket (Hash)
      #   * :attachments (Array<Merge::Ticketing::TicketRequestAttachmentsItem>)
      #   * :tags (Array<String>)
      #   * :completed_at (DateTime)
      #   * :ticket_url (String)
      #   * :priority (Merge::Ticketing::PriorityEnum)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      #   * :remote_fields (Array<Merge::Ticketing::RemoteFieldRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::TicketResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.create(model: {  })
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
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
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets"
          end
          Merge::Ticketing::TicketResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `Ticket` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Ticketing::Tickets::TicketsRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_remote_fields [Boolean] Whether to include all remote fields, including fields that Merge did not map to
      #  common models, in a normalized format.
      # @param remote_fields [Merge::Ticketing::Tickets::TicketsRetrieveRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [Merge::Ticketing::Tickets::TicketsRetrieveRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::Ticket]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, include_remote_fields: nil, remote_fields: nil,
                   show_enum_origins: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "expand": expand,
              "include_remote_data": include_remote_data,
              "include_remote_fields": include_remote_fields,
              "remote_fields": remote_fields,
              "show_enum_origins": show_enum_origins
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/#{id}"
          end
          Merge::Ticketing::Ticket.from_json(json_object: response.body)
        end
      end

      # Updates a `Ticket` object with the given `id`.
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Ticketing::PatchedTicketRequest, as a Hash
      #   * :name (String)
      #   * :assignees (Array<String>)
      #   * :creator (String)
      #   * :due_date (DateTime)
      #   * :status (Merge::Ticketing::TicketStatusEnum)
      #   * :description (String)
      #   * :collections (Array<String>)
      #   * :ticket_type (String)
      #   * :account (String)
      #   * :contact (String)
      #   * :parent_ticket (String)
      #   * :tags (Array<String>)
      #   * :completed_at (DateTime)
      #   * :ticket_url (String)
      #   * :priority (Merge::Ticketing::PriorityEnum)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      #   * :remote_fields (Array<Merge::Ticketing::RemoteFieldRequest>)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::TicketResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.partial_update(id: "id", model: {  })
      def partial_update(id:, model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.patch do |req|
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
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/#{id}"
          end
          Merge::Ticketing::TicketResponse.from_json(json_object: response.body)
        end
      end

      # Returns a list of `User` objects.
      #
      # @param parent_id [String]
      # @param cursor [String] The pagination cursor value.
      # @param expand [Merge::Ticketing::Tickets::TicketsCollaboratorsListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::PaginatedUserList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.collaborators_list(parent_id: "parent_id")
      def collaborators_list(parent_id:, cursor: nil, expand: nil, include_deleted_data: nil, include_remote_data: nil,
                             page_size: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "cursor": cursor,
              "expand": expand,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "page_size": page_size
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/#{parent_id}/collaborators"
          end
          Merge::Ticketing::PaginatedUserList.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Ticket` PATCHs.
      #
      # @param id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.meta_patch_retrieve(id: "id")
      def meta_patch_retrieve(id:, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/meta/patch/#{id}"
          end
          Merge::Ticketing::MetaResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Ticket` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.meta_post_retrieve
      def meta_post_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/meta/post"
          end
          Merge::Ticketing::MetaResponse.from_json(json_object: response.body)
        end
      end

      # Returns a list of `RemoteFieldClass` objects.
      #
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Whether to include data that was marked as deleted by third party webhooks.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param page_size [Integer] Number of results to return per page.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ticketing::PaginatedRemoteFieldClassList]
      # @example
      #  api = Merge::Client.new(
      #    environment: Environment::PRODUCTION,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ticketing.remote_field_classes_list
      def remote_field_classes_list(cursor: nil, include_deleted_data: nil, include_remote_data: nil, page_size: nil,
                                    request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "cursor": cursor,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "page_size": page_size
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ticketing/v1/tickets/remote-field-classes"
          end
          Merge::Ticketing::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
        end
      end
    end
  end
end
