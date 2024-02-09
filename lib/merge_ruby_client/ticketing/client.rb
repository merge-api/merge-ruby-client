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
require_relative "delete_account/client"
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
      attr_reader :account_details, :account_token, :accounts, :async_passthrough, :attachments, :audit_trail,
                  :available_actions, :collections, :comments, :contacts, :delete_account, :generate_key, :issues, :link_token, :linked_accounts, :passthrough, :projects, :regenerate_key, :roles, :selective_sync, :sync_status, :force_resync, :tags, :teams, :tickets, :users, :webhook_receivers

      # @param request_client [RequestClient]
      # @return [Ticketing::Client]
      def initialize(request_client:)
        @account_details = Ticketing::AccountDetailsClient.new(request_client: request_client)
        @account_token = Ticketing::AccountTokenClient.new(request_client: request_client)
        @accounts = Ticketing::AccountsClient.new(request_client: request_client)
        @async_passthrough = Ticketing::AsyncPassthroughClient.new(request_client: request_client)
        @attachments = Ticketing::AttachmentsClient.new(request_client: request_client)
        @audit_trail = Ticketing::AuditTrailClient.new(request_client: request_client)
        @available_actions = Ticketing::AvailableActionsClient.new(request_client: request_client)
        @collections = Ticketing::CollectionsClient.new(request_client: request_client)
        @comments = Ticketing::CommentsClient.new(request_client: request_client)
        @contacts = Ticketing::ContactsClient.new(request_client: request_client)
        @delete_account = Ticketing::DeleteAccountClient.new(request_client: request_client)
        @generate_key = Ticketing::GenerateKeyClient.new(request_client: request_client)
        @issues = Ticketing::IssuesClient.new(request_client: request_client)
        @link_token = Ticketing::LinkTokenClient.new(request_client: request_client)
        @linked_accounts = Ticketing::LinkedAccountsClient.new(request_client: request_client)
        @passthrough = Ticketing::PassthroughClient.new(request_client: request_client)
        @projects = Ticketing::ProjectsClient.new(request_client: request_client)
        @regenerate_key = Ticketing::RegenerateKeyClient.new(request_client: request_client)
        @roles = Ticketing::RolesClient.new(request_client: request_client)
        @selective_sync = Ticketing::SelectiveSyncClient.new(request_client: request_client)
        @sync_status = Ticketing::SyncStatusClient.new(request_client: request_client)
        @force_resync = Ticketing::ForceResyncClient.new(request_client: request_client)
        @tags = Ticketing::TagsClient.new(request_client: request_client)
        @teams = Ticketing::TeamsClient.new(request_client: request_client)
        @tickets = Ticketing::TicketsClient.new(request_client: request_client)
        @users = Ticketing::UsersClient.new(request_client: request_client)
        @webhook_receivers = Ticketing::WebhookReceiversClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      attr_reader :account_details, :account_token, :accounts, :async_passthrough, :attachments, :audit_trail,
                  :available_actions, :collections, :comments, :contacts, :delete_account, :generate_key, :issues, :link_token, :linked_accounts, :passthrough, :projects, :regenerate_key, :roles, :selective_sync, :sync_status, :force_resync, :tags, :teams, :tickets, :users, :webhook_receivers

      # @param request_client [RequestClient]
      # @return [Ticketing::AsyncClient]
      def initialize(request_client:)
        @account_details = Ticketing::AsyncAccountDetailsClient.new(request_client: request_client)
        @account_token = Ticketing::AsyncAccountTokenClient.new(request_client: request_client)
        @accounts = Ticketing::AsyncAccountsClient.new(request_client: request_client)
        @async_passthrough = Ticketing::AsyncAsyncPassthroughClient.new(request_client: request_client)
        @attachments = Ticketing::AsyncAttachmentsClient.new(request_client: request_client)
        @audit_trail = Ticketing::AsyncAuditTrailClient.new(request_client: request_client)
        @available_actions = Ticketing::AsyncAvailableActionsClient.new(request_client: request_client)
        @collections = Ticketing::AsyncCollectionsClient.new(request_client: request_client)
        @comments = Ticketing::AsyncCommentsClient.new(request_client: request_client)
        @contacts = Ticketing::AsyncContactsClient.new(request_client: request_client)
        @delete_account = Ticketing::AsyncDeleteAccountClient.new(request_client: request_client)
        @generate_key = Ticketing::AsyncGenerateKeyClient.new(request_client: request_client)
        @issues = Ticketing::AsyncIssuesClient.new(request_client: request_client)
        @link_token = Ticketing::AsyncLinkTokenClient.new(request_client: request_client)
        @linked_accounts = Ticketing::AsyncLinkedAccountsClient.new(request_client: request_client)
        @passthrough = Ticketing::AsyncPassthroughClient.new(request_client: request_client)
        @projects = Ticketing::AsyncProjectsClient.new(request_client: request_client)
        @regenerate_key = Ticketing::AsyncRegenerateKeyClient.new(request_client: request_client)
        @roles = Ticketing::AsyncRolesClient.new(request_client: request_client)
        @selective_sync = Ticketing::AsyncSelectiveSyncClient.new(request_client: request_client)
        @sync_status = Ticketing::AsyncSyncStatusClient.new(request_client: request_client)
        @force_resync = Ticketing::AsyncForceResyncClient.new(request_client: request_client)
        @tags = Ticketing::AsyncTagsClient.new(request_client: request_client)
        @teams = Ticketing::AsyncTeamsClient.new(request_client: request_client)
        @tickets = Ticketing::AsyncTicketsClient.new(request_client: request_client)
        @users = Ticketing::AsyncUsersClient.new(request_client: request_client)
        @webhook_receivers = Ticketing::AsyncWebhookReceiversClient.new(request_client: request_client)
      end
    end
  end
end
