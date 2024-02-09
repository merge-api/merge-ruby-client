# frozen_string_literal: true

require_relative "../../requests"
require_relative "account_details/client"
require_relative "account_token/client"
require_relative "async_passthrough/client"
require_relative "audit_trail/client"
require_relative "available_actions/client"
require_relative "delete_account/client"
require_relative "drives/client"
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
      attr_reader :account_details, :account_token, :async_passthrough, :audit_trail, :available_actions,
                  :delete_account, :drives, :files, :folders, :generate_key, :groups, :issues, :link_token, :linked_accounts, :passthrough, :regenerate_key, :selective_sync, :sync_status, :force_resync, :users, :webhook_receivers

      # @param request_client [RequestClient]
      # @return [Filestorage::Client]
      def initialize(request_client:)
        @account_details = Filestorage::AccountDetailsClient.new(request_client: request_client)
        @account_token = Filestorage::AccountTokenClient.new(request_client: request_client)
        @async_passthrough = Filestorage::AsyncPassthroughClient.new(request_client: request_client)
        @audit_trail = Filestorage::AuditTrailClient.new(request_client: request_client)
        @available_actions = Filestorage::AvailableActionsClient.new(request_client: request_client)
        @delete_account = Filestorage::DeleteAccountClient.new(request_client: request_client)
        @drives = Filestorage::DrivesClient.new(request_client: request_client)
        @files = Filestorage::FilesClient.new(request_client: request_client)
        @folders = Filestorage::FoldersClient.new(request_client: request_client)
        @generate_key = Filestorage::GenerateKeyClient.new(request_client: request_client)
        @groups = Filestorage::GroupsClient.new(request_client: request_client)
        @issues = Filestorage::IssuesClient.new(request_client: request_client)
        @link_token = Filestorage::LinkTokenClient.new(request_client: request_client)
        @linked_accounts = Filestorage::LinkedAccountsClient.new(request_client: request_client)
        @passthrough = Filestorage::PassthroughClient.new(request_client: request_client)
        @regenerate_key = Filestorage::RegenerateKeyClient.new(request_client: request_client)
        @selective_sync = Filestorage::SelectiveSyncClient.new(request_client: request_client)
        @sync_status = Filestorage::SyncStatusClient.new(request_client: request_client)
        @force_resync = Filestorage::ForceResyncClient.new(request_client: request_client)
        @users = Filestorage::UsersClient.new(request_client: request_client)
        @webhook_receivers = Filestorage::WebhookReceiversClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      attr_reader :account_details, :account_token, :async_passthrough, :audit_trail, :available_actions,
                  :delete_account, :drives, :files, :folders, :generate_key, :groups, :issues, :link_token, :linked_accounts, :passthrough, :regenerate_key, :selective_sync, :sync_status, :force_resync, :users, :webhook_receivers

      # @param request_client [RequestClient]
      # @return [Filestorage::AsyncClient]
      def initialize(request_client:)
        @account_details = Filestorage::AsyncAccountDetailsClient.new(request_client: request_client)
        @account_token = Filestorage::AsyncAccountTokenClient.new(request_client: request_client)
        @async_passthrough = Filestorage::AsyncAsyncPassthroughClient.new(request_client: request_client)
        @audit_trail = Filestorage::AsyncAuditTrailClient.new(request_client: request_client)
        @available_actions = Filestorage::AsyncAvailableActionsClient.new(request_client: request_client)
        @delete_account = Filestorage::AsyncDeleteAccountClient.new(request_client: request_client)
        @drives = Filestorage::AsyncDrivesClient.new(request_client: request_client)
        @files = Filestorage::AsyncFilesClient.new(request_client: request_client)
        @folders = Filestorage::AsyncFoldersClient.new(request_client: request_client)
        @generate_key = Filestorage::AsyncGenerateKeyClient.new(request_client: request_client)
        @groups = Filestorage::AsyncGroupsClient.new(request_client: request_client)
        @issues = Filestorage::AsyncIssuesClient.new(request_client: request_client)
        @link_token = Filestorage::AsyncLinkTokenClient.new(request_client: request_client)
        @linked_accounts = Filestorage::AsyncLinkedAccountsClient.new(request_client: request_client)
        @passthrough = Filestorage::AsyncPassthroughClient.new(request_client: request_client)
        @regenerate_key = Filestorage::AsyncRegenerateKeyClient.new(request_client: request_client)
        @selective_sync = Filestorage::AsyncSelectiveSyncClient.new(request_client: request_client)
        @sync_status = Filestorage::AsyncSyncStatusClient.new(request_client: request_client)
        @force_resync = Filestorage::AsyncForceResyncClient.new(request_client: request_client)
        @users = Filestorage::AsyncUsersClient.new(request_client: request_client)
        @webhook_receivers = Filestorage::AsyncWebhookReceiversClient.new(request_client: request_client)
      end
    end
  end
end
