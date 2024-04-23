# frozen_string_literal: true

require_relative "../../requests"
require_relative "account_details/client"
require_relative "account_token/client"
require_relative "accounts/client"
require_relative "async_passthrough/client"
require_relative "attachments/client"
require_relative "audit_trail/client"
require_relative "available_actions/client"
require_relative "collections/client"
require_relative "comments/client"
require_relative "contacts/client"
require_relative "scopes/client"
require_relative "delete_account/client"
require_relative "field_mapping/client"
require_relative "generate_key/client"
require_relative "issues/client"
require_relative "link_token/client"
require_relative "linked_accounts/client"
require_relative "passthrough/client"
require_relative "projects/client"
require_relative "regenerate_key/client"
require_relative "roles/client"
require_relative "selective_sync/client"
require_relative "sync_status/client"
require_relative "force_resync/client"
require_relative "tags/client"
require_relative "teams/client"
require_relative "tickets/client"
require_relative "users/client"
require_relative "webhook_receivers/client"

module Merge
  module Ticketing
    class Client
      # @return [Merge::Ticketing::AccountDetailsClient]
      attr_reader :account_details
      # @return [Merge::Ticketing::AccountTokenClient]
      attr_reader :account_token
      # @return [Merge::Ticketing::AccountsClient]
      attr_reader :accounts
      # @return [Merge::Ticketing::AsyncPassthroughClient]
      attr_reader :async_passthrough
      # @return [Merge::Ticketing::AttachmentsClient]
      attr_reader :attachments
      # @return [Merge::Ticketing::AuditTrailClient]
      attr_reader :audit_trail
      # @return [Merge::Ticketing::AvailableActionsClient]
      attr_reader :available_actions
      # @return [Merge::Ticketing::CollectionsClient]
      attr_reader :collections
      # @return [Merge::Ticketing::CommentsClient]
      attr_reader :comments
      # @return [Merge::Ticketing::ContactsClient]
      attr_reader :contacts
      # @return [Merge::Ticketing::ScopesClient]
      attr_reader :scopes
      # @return [Merge::Ticketing::DeleteAccountClient]
      attr_reader :delete_account
      # @return [Merge::Ticketing::FieldMappingClient]
      attr_reader :field_mapping
      # @return [Merge::Ticketing::GenerateKeyClient]
      attr_reader :generate_key
      # @return [Merge::Ticketing::IssuesClient]
      attr_reader :issues
      # @return [Merge::Ticketing::LinkTokenClient]
      attr_reader :link_token
      # @return [Merge::Ticketing::LinkedAccountsClient]
      attr_reader :linked_accounts
      # @return [Merge::Ticketing::PassthroughClient]
      attr_reader :passthrough
      # @return [Merge::Ticketing::ProjectsClient]
      attr_reader :projects
      # @return [Merge::Ticketing::RegenerateKeyClient]
      attr_reader :regenerate_key
      # @return [Merge::Ticketing::RolesClient]
      attr_reader :roles
      # @return [Merge::Ticketing::SelectiveSyncClient]
      attr_reader :selective_sync
      # @return [Merge::Ticketing::SyncStatusClient]
      attr_reader :sync_status
      # @return [Merge::Ticketing::ForceResyncClient]
      attr_reader :force_resync
      # @return [Merge::Ticketing::TagsClient]
      attr_reader :tags
      # @return [Merge::Ticketing::TeamsClient]
      attr_reader :teams
      # @return [Merge::Ticketing::TicketsClient]
      attr_reader :tickets
      # @return [Merge::Ticketing::UsersClient]
      attr_reader :users
      # @return [Merge::Ticketing::WebhookReceiversClient]
      attr_reader :webhook_receivers

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Ticketing::Client]
      def initialize(request_client:)
        @account_details = Merge::Ticketing::AccountDetailsClient.new(request_client: request_client)
        @account_token = Merge::Ticketing::AccountTokenClient.new(request_client: request_client)
        @accounts = Merge::Ticketing::AccountsClient.new(request_client: request_client)
        @async_passthrough = Merge::Ticketing::AsyncPassthroughClient.new(request_client: request_client)
        @attachments = Merge::Ticketing::AttachmentsClient.new(request_client: request_client)
        @audit_trail = Merge::Ticketing::AuditTrailClient.new(request_client: request_client)
        @available_actions = Merge::Ticketing::AvailableActionsClient.new(request_client: request_client)
        @collections = Merge::Ticketing::CollectionsClient.new(request_client: request_client)
        @comments = Merge::Ticketing::CommentsClient.new(request_client: request_client)
        @contacts = Merge::Ticketing::ContactsClient.new(request_client: request_client)
        @scopes = Merge::Ticketing::ScopesClient.new(request_client: request_client)
        @delete_account = Merge::Ticketing::DeleteAccountClient.new(request_client: request_client)
        @field_mapping = Merge::Ticketing::FieldMappingClient.new(request_client: request_client)
        @generate_key = Merge::Ticketing::GenerateKeyClient.new(request_client: request_client)
        @issues = Merge::Ticketing::IssuesClient.new(request_client: request_client)
        @link_token = Merge::Ticketing::LinkTokenClient.new(request_client: request_client)
        @linked_accounts = Merge::Ticketing::LinkedAccountsClient.new(request_client: request_client)
        @passthrough = Merge::Ticketing::PassthroughClient.new(request_client: request_client)
        @projects = Merge::Ticketing::ProjectsClient.new(request_client: request_client)
        @regenerate_key = Merge::Ticketing::RegenerateKeyClient.new(request_client: request_client)
        @roles = Merge::Ticketing::RolesClient.new(request_client: request_client)
        @selective_sync = Merge::Ticketing::SelectiveSyncClient.new(request_client: request_client)
        @sync_status = Merge::Ticketing::SyncStatusClient.new(request_client: request_client)
        @force_resync = Merge::Ticketing::ForceResyncClient.new(request_client: request_client)
        @tags = Merge::Ticketing::TagsClient.new(request_client: request_client)
        @teams = Merge::Ticketing::TeamsClient.new(request_client: request_client)
        @tickets = Merge::Ticketing::TicketsClient.new(request_client: request_client)
        @users = Merge::Ticketing::UsersClient.new(request_client: request_client)
        @webhook_receivers = Merge::Ticketing::WebhookReceiversClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [Merge::Ticketing::AsyncAccountDetailsClient]
      attr_reader :account_details
      # @return [Merge::Ticketing::AsyncAccountTokenClient]
      attr_reader :account_token
      # @return [Merge::Ticketing::AsyncAccountsClient]
      attr_reader :accounts
      # @return [Merge::Ticketing::AsyncAsyncPassthroughClient]
      attr_reader :async_passthrough
      # @return [Merge::Ticketing::AsyncAttachmentsClient]
      attr_reader :attachments
      # @return [Merge::Ticketing::AsyncAuditTrailClient]
      attr_reader :audit_trail
      # @return [Merge::Ticketing::AsyncAvailableActionsClient]
      attr_reader :available_actions
      # @return [Merge::Ticketing::AsyncCollectionsClient]
      attr_reader :collections
      # @return [Merge::Ticketing::AsyncCommentsClient]
      attr_reader :comments
      # @return [Merge::Ticketing::AsyncContactsClient]
      attr_reader :contacts
      # @return [Merge::Ticketing::AsyncScopesClient]
      attr_reader :scopes
      # @return [Merge::Ticketing::AsyncDeleteAccountClient]
      attr_reader :delete_account
      # @return [Merge::Ticketing::AsyncFieldMappingClient]
      attr_reader :field_mapping
      # @return [Merge::Ticketing::AsyncGenerateKeyClient]
      attr_reader :generate_key
      # @return [Merge::Ticketing::AsyncIssuesClient]
      attr_reader :issues
      # @return [Merge::Ticketing::AsyncLinkTokenClient]
      attr_reader :link_token
      # @return [Merge::Ticketing::AsyncLinkedAccountsClient]
      attr_reader :linked_accounts
      # @return [Merge::Ticketing::AsyncPassthroughClient]
      attr_reader :passthrough
      # @return [Merge::Ticketing::AsyncProjectsClient]
      attr_reader :projects
      # @return [Merge::Ticketing::AsyncRegenerateKeyClient]
      attr_reader :regenerate_key
      # @return [Merge::Ticketing::AsyncRolesClient]
      attr_reader :roles
      # @return [Merge::Ticketing::AsyncSelectiveSyncClient]
      attr_reader :selective_sync
      # @return [Merge::Ticketing::AsyncSyncStatusClient]
      attr_reader :sync_status
      # @return [Merge::Ticketing::AsyncForceResyncClient]
      attr_reader :force_resync
      # @return [Merge::Ticketing::AsyncTagsClient]
      attr_reader :tags
      # @return [Merge::Ticketing::AsyncTeamsClient]
      attr_reader :teams
      # @return [Merge::Ticketing::AsyncTicketsClient]
      attr_reader :tickets
      # @return [Merge::Ticketing::AsyncUsersClient]
      attr_reader :users
      # @return [Merge::Ticketing::AsyncWebhookReceiversClient]
      attr_reader :webhook_receivers

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Ticketing::AsyncClient]
      def initialize(request_client:)
        @account_details = Merge::Ticketing::AsyncAccountDetailsClient.new(request_client: request_client)
        @account_token = Merge::Ticketing::AsyncAccountTokenClient.new(request_client: request_client)
        @accounts = Merge::Ticketing::AsyncAccountsClient.new(request_client: request_client)
        @async_passthrough = Merge::Ticketing::AsyncAsyncPassthroughClient.new(request_client: request_client)
        @attachments = Merge::Ticketing::AsyncAttachmentsClient.new(request_client: request_client)
        @audit_trail = Merge::Ticketing::AsyncAuditTrailClient.new(request_client: request_client)
        @available_actions = Merge::Ticketing::AsyncAvailableActionsClient.new(request_client: request_client)
        @collections = Merge::Ticketing::AsyncCollectionsClient.new(request_client: request_client)
        @comments = Merge::Ticketing::AsyncCommentsClient.new(request_client: request_client)
        @contacts = Merge::Ticketing::AsyncContactsClient.new(request_client: request_client)
        @scopes = Merge::Ticketing::AsyncScopesClient.new(request_client: request_client)
        @delete_account = Merge::Ticketing::AsyncDeleteAccountClient.new(request_client: request_client)
        @field_mapping = Merge::Ticketing::AsyncFieldMappingClient.new(request_client: request_client)
        @generate_key = Merge::Ticketing::AsyncGenerateKeyClient.new(request_client: request_client)
        @issues = Merge::Ticketing::AsyncIssuesClient.new(request_client: request_client)
        @link_token = Merge::Ticketing::AsyncLinkTokenClient.new(request_client: request_client)
        @linked_accounts = Merge::Ticketing::AsyncLinkedAccountsClient.new(request_client: request_client)
        @passthrough = Merge::Ticketing::AsyncPassthroughClient.new(request_client: request_client)
        @projects = Merge::Ticketing::AsyncProjectsClient.new(request_client: request_client)
        @regenerate_key = Merge::Ticketing::AsyncRegenerateKeyClient.new(request_client: request_client)
        @roles = Merge::Ticketing::AsyncRolesClient.new(request_client: request_client)
        @selective_sync = Merge::Ticketing::AsyncSelectiveSyncClient.new(request_client: request_client)
        @sync_status = Merge::Ticketing::AsyncSyncStatusClient.new(request_client: request_client)
        @force_resync = Merge::Ticketing::AsyncForceResyncClient.new(request_client: request_client)
        @tags = Merge::Ticketing::AsyncTagsClient.new(request_client: request_client)
        @teams = Merge::Ticketing::AsyncTeamsClient.new(request_client: request_client)
        @tickets = Merge::Ticketing::AsyncTicketsClient.new(request_client: request_client)
        @users = Merge::Ticketing::AsyncUsersClient.new(request_client: request_client)
        @webhook_receivers = Merge::Ticketing::AsyncWebhookReceiversClient.new(request_client: request_client)
      end
    end
  end
end
