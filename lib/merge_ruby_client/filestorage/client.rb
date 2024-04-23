# frozen_string_literal: true

require_relative "../../requests"
require_relative "account_details/client"
require_relative "account_token/client"
require_relative "async_passthrough/client"
require_relative "audit_trail/client"
require_relative "available_actions/client"
require_relative "scopes/client"
require_relative "delete_account/client"
require_relative "drives/client"
require_relative "field_mapping/client"
require_relative "files/client"
require_relative "folders/client"
require_relative "generate_key/client"
require_relative "groups/client"
require_relative "issues/client"
require_relative "link_token/client"
require_relative "linked_accounts/client"
require_relative "passthrough/client"
require_relative "regenerate_key/client"
require_relative "selective_sync/client"
require_relative "sync_status/client"
require_relative "force_resync/client"
require_relative "users/client"
require_relative "webhook_receivers/client"

module Merge
  module Filestorage
    class Client
      # @return [Merge::Filestorage::AccountDetailsClient]
      attr_reader :account_details
      # @return [Merge::Filestorage::AccountTokenClient]
      attr_reader :account_token
      # @return [Merge::Filestorage::AsyncPassthroughClient]
      attr_reader :async_passthrough
      # @return [Merge::Filestorage::AuditTrailClient]
      attr_reader :audit_trail
      # @return [Merge::Filestorage::AvailableActionsClient]
      attr_reader :available_actions
      # @return [Merge::Filestorage::ScopesClient]
      attr_reader :scopes
      # @return [Merge::Filestorage::DeleteAccountClient]
      attr_reader :delete_account
      # @return [Merge::Filestorage::DrivesClient]
      attr_reader :drives
      # @return [Merge::Filestorage::FieldMappingClient]
      attr_reader :field_mapping
      # @return [Merge::Filestorage::FilesClient]
      attr_reader :files
      # @return [Merge::Filestorage::FoldersClient]
      attr_reader :folders
      # @return [Merge::Filestorage::GenerateKeyClient]
      attr_reader :generate_key
      # @return [Merge::Filestorage::GroupsClient]
      attr_reader :groups
      # @return [Merge::Filestorage::IssuesClient]
      attr_reader :issues
      # @return [Merge::Filestorage::LinkTokenClient]
      attr_reader :link_token
      # @return [Merge::Filestorage::LinkedAccountsClient]
      attr_reader :linked_accounts
      # @return [Merge::Filestorage::PassthroughClient]
      attr_reader :passthrough
      # @return [Merge::Filestorage::RegenerateKeyClient]
      attr_reader :regenerate_key
      # @return [Merge::Filestorage::SelectiveSyncClient]
      attr_reader :selective_sync
      # @return [Merge::Filestorage::SyncStatusClient]
      attr_reader :sync_status
      # @return [Merge::Filestorage::ForceResyncClient]
      attr_reader :force_resync
      # @return [Merge::Filestorage::UsersClient]
      attr_reader :users
      # @return [Merge::Filestorage::WebhookReceiversClient]
      attr_reader :webhook_receivers

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Filestorage::Client]
      def initialize(request_client:)
        @account_details = Merge::Filestorage::AccountDetailsClient.new(request_client: request_client)
        @account_token = Merge::Filestorage::AccountTokenClient.new(request_client: request_client)
        @async_passthrough = Merge::Filestorage::AsyncPassthroughClient.new(request_client: request_client)
        @audit_trail = Merge::Filestorage::AuditTrailClient.new(request_client: request_client)
        @available_actions = Merge::Filestorage::AvailableActionsClient.new(request_client: request_client)
        @scopes = Merge::Filestorage::ScopesClient.new(request_client: request_client)
        @delete_account = Merge::Filestorage::DeleteAccountClient.new(request_client: request_client)
        @drives = Merge::Filestorage::DrivesClient.new(request_client: request_client)
        @field_mapping = Merge::Filestorage::FieldMappingClient.new(request_client: request_client)
        @files = Merge::Filestorage::FilesClient.new(request_client: request_client)
        @folders = Merge::Filestorage::FoldersClient.new(request_client: request_client)
        @generate_key = Merge::Filestorage::GenerateKeyClient.new(request_client: request_client)
        @groups = Merge::Filestorage::GroupsClient.new(request_client: request_client)
        @issues = Merge::Filestorage::IssuesClient.new(request_client: request_client)
        @link_token = Merge::Filestorage::LinkTokenClient.new(request_client: request_client)
        @linked_accounts = Merge::Filestorage::LinkedAccountsClient.new(request_client: request_client)
        @passthrough = Merge::Filestorage::PassthroughClient.new(request_client: request_client)
        @regenerate_key = Merge::Filestorage::RegenerateKeyClient.new(request_client: request_client)
        @selective_sync = Merge::Filestorage::SelectiveSyncClient.new(request_client: request_client)
        @sync_status = Merge::Filestorage::SyncStatusClient.new(request_client: request_client)
        @force_resync = Merge::Filestorage::ForceResyncClient.new(request_client: request_client)
        @users = Merge::Filestorage::UsersClient.new(request_client: request_client)
        @webhook_receivers = Merge::Filestorage::WebhookReceiversClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [Merge::Filestorage::AsyncAccountDetailsClient]
      attr_reader :account_details
      # @return [Merge::Filestorage::AsyncAccountTokenClient]
      attr_reader :account_token
      # @return [Merge::Filestorage::AsyncAsyncPassthroughClient]
      attr_reader :async_passthrough
      # @return [Merge::Filestorage::AsyncAuditTrailClient]
      attr_reader :audit_trail
      # @return [Merge::Filestorage::AsyncAvailableActionsClient]
      attr_reader :available_actions
      # @return [Merge::Filestorage::AsyncScopesClient]
      attr_reader :scopes
      # @return [Merge::Filestorage::AsyncDeleteAccountClient]
      attr_reader :delete_account
      # @return [Merge::Filestorage::AsyncDrivesClient]
      attr_reader :drives
      # @return [Merge::Filestorage::AsyncFieldMappingClient]
      attr_reader :field_mapping
      # @return [Merge::Filestorage::AsyncFilesClient]
      attr_reader :files
      # @return [Merge::Filestorage::AsyncFoldersClient]
      attr_reader :folders
      # @return [Merge::Filestorage::AsyncGenerateKeyClient]
      attr_reader :generate_key
      # @return [Merge::Filestorage::AsyncGroupsClient]
      attr_reader :groups
      # @return [Merge::Filestorage::AsyncIssuesClient]
      attr_reader :issues
      # @return [Merge::Filestorage::AsyncLinkTokenClient]
      attr_reader :link_token
      # @return [Merge::Filestorage::AsyncLinkedAccountsClient]
      attr_reader :linked_accounts
      # @return [Merge::Filestorage::AsyncPassthroughClient]
      attr_reader :passthrough
      # @return [Merge::Filestorage::AsyncRegenerateKeyClient]
      attr_reader :regenerate_key
      # @return [Merge::Filestorage::AsyncSelectiveSyncClient]
      attr_reader :selective_sync
      # @return [Merge::Filestorage::AsyncSyncStatusClient]
      attr_reader :sync_status
      # @return [Merge::Filestorage::AsyncForceResyncClient]
      attr_reader :force_resync
      # @return [Merge::Filestorage::AsyncUsersClient]
      attr_reader :users
      # @return [Merge::Filestorage::AsyncWebhookReceiversClient]
      attr_reader :webhook_receivers

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Filestorage::AsyncClient]
      def initialize(request_client:)
        @account_details = Merge::Filestorage::AsyncAccountDetailsClient.new(request_client: request_client)
        @account_token = Merge::Filestorage::AsyncAccountTokenClient.new(request_client: request_client)
        @async_passthrough = Merge::Filestorage::AsyncAsyncPassthroughClient.new(request_client: request_client)
        @audit_trail = Merge::Filestorage::AsyncAuditTrailClient.new(request_client: request_client)
        @available_actions = Merge::Filestorage::AsyncAvailableActionsClient.new(request_client: request_client)
        @scopes = Merge::Filestorage::AsyncScopesClient.new(request_client: request_client)
        @delete_account = Merge::Filestorage::AsyncDeleteAccountClient.new(request_client: request_client)
        @drives = Merge::Filestorage::AsyncDrivesClient.new(request_client: request_client)
        @field_mapping = Merge::Filestorage::AsyncFieldMappingClient.new(request_client: request_client)
        @files = Merge::Filestorage::AsyncFilesClient.new(request_client: request_client)
        @folders = Merge::Filestorage::AsyncFoldersClient.new(request_client: request_client)
        @generate_key = Merge::Filestorage::AsyncGenerateKeyClient.new(request_client: request_client)
        @groups = Merge::Filestorage::AsyncGroupsClient.new(request_client: request_client)
        @issues = Merge::Filestorage::AsyncIssuesClient.new(request_client: request_client)
        @link_token = Merge::Filestorage::AsyncLinkTokenClient.new(request_client: request_client)
        @linked_accounts = Merge::Filestorage::AsyncLinkedAccountsClient.new(request_client: request_client)
        @passthrough = Merge::Filestorage::AsyncPassthroughClient.new(request_client: request_client)
        @regenerate_key = Merge::Filestorage::AsyncRegenerateKeyClient.new(request_client: request_client)
        @selective_sync = Merge::Filestorage::AsyncSelectiveSyncClient.new(request_client: request_client)
        @sync_status = Merge::Filestorage::AsyncSyncStatusClient.new(request_client: request_client)
        @force_resync = Merge::Filestorage::AsyncForceResyncClient.new(request_client: request_client)
        @users = Merge::Filestorage::AsyncUsersClient.new(request_client: request_client)
        @webhook_receivers = Merge::Filestorage::AsyncWebhookReceiversClient.new(request_client: request_client)
      end
    end
  end
end
