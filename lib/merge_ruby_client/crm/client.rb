# frozen_string_literal: true

require_relative "../../requests"
require_relative "account_details/client"
require_relative "account_token/client"
require_relative "accounts/client"
require_relative "async_passthrough/client"
require_relative "audit_trail/client"
require_relative "available_actions/client"
require_relative "contacts/client"
require_relative "custom_object_classes/client"
require_relative "association_types/client"
require_relative "custom_objects/client"
require_relative "associations/client"
require_relative "delete_account/client"
require_relative "engagement_types/client"
require_relative "engagements/client"
require_relative "generate_key/client"
require_relative "issues/client"
require_relative "leads/client"
require_relative "link_token/client"
require_relative "linked_accounts/client"
require_relative "notes/client"
require_relative "opportunities/client"
require_relative "passthrough/client"
require_relative "regenerate_key/client"
require_relative "selective_sync/client"
require_relative "stages/client"
require_relative "sync_status/client"
require_relative "force_resync/client"
require_relative "tasks/client"
require_relative "users/client"
require_relative "webhook_receivers/client"

module Merge
  module Crm
    class Client
      attr_reader :account_details, :account_token, :accounts, :async_passthrough, :audit_trail, :available_actions,
                  :contacts, :custom_object_classes, :association_types, :custom_objects, :associations, :delete_account, :engagement_types, :engagements, :generate_key, :issues, :leads, :link_token, :linked_accounts, :notes, :opportunities, :passthrough, :regenerate_key, :selective_sync, :stages, :sync_status, :force_resync, :tasks, :users, :webhook_receivers

      # @param request_client [RequestClient]
      # @return [Crm::Client]
      def initialize(request_client:)
        @account_details = Crm::AccountDetailsClient.new(request_client: request_client)
        @account_token = Crm::AccountTokenClient.new(request_client: request_client)
        @accounts = Crm::AccountsClient.new(request_client: request_client)
        @async_passthrough = Crm::AsyncPassthroughClient.new(request_client: request_client)
        @audit_trail = Crm::AuditTrailClient.new(request_client: request_client)
        @available_actions = Crm::AvailableActionsClient.new(request_client: request_client)
        @contacts = Crm::ContactsClient.new(request_client: request_client)
        @custom_object_classes = Crm::CustomObjectClassesClient.new(request_client: request_client)
        @association_types = Crm::AssociationTypesClient.new(request_client: request_client)
        @custom_objects = Crm::CustomObjectsClient.new(request_client: request_client)
        @associations = Crm::AssociationsClient.new(request_client: request_client)
        @delete_account = Crm::DeleteAccountClient.new(request_client: request_client)
        @engagement_types = Crm::EngagementTypesClient.new(request_client: request_client)
        @engagements = Crm::EngagementsClient.new(request_client: request_client)
        @generate_key = Crm::GenerateKeyClient.new(request_client: request_client)
        @issues = Crm::IssuesClient.new(request_client: request_client)
        @leads = Crm::LeadsClient.new(request_client: request_client)
        @link_token = Crm::LinkTokenClient.new(request_client: request_client)
        @linked_accounts = Crm::LinkedAccountsClient.new(request_client: request_client)
        @notes = Crm::NotesClient.new(request_client: request_client)
        @opportunities = Crm::OpportunitiesClient.new(request_client: request_client)
        @passthrough = Crm::PassthroughClient.new(request_client: request_client)
        @regenerate_key = Crm::RegenerateKeyClient.new(request_client: request_client)
        @selective_sync = Crm::SelectiveSyncClient.new(request_client: request_client)
        @stages = Crm::StagesClient.new(request_client: request_client)
        @sync_status = Crm::SyncStatusClient.new(request_client: request_client)
        @force_resync = Crm::ForceResyncClient.new(request_client: request_client)
        @tasks = Crm::TasksClient.new(request_client: request_client)
        @users = Crm::UsersClient.new(request_client: request_client)
        @webhook_receivers = Crm::WebhookReceiversClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      attr_reader :account_details, :account_token, :accounts, :async_passthrough, :audit_trail, :available_actions,
                  :contacts, :custom_object_classes, :association_types, :custom_objects, :associations, :delete_account, :engagement_types, :engagements, :generate_key, :issues, :leads, :link_token, :linked_accounts, :notes, :opportunities, :passthrough, :regenerate_key, :selective_sync, :stages, :sync_status, :force_resync, :tasks, :users, :webhook_receivers

      # @param request_client [RequestClient]
      # @return [Crm::AsyncClient]
      def initialize(request_client:)
        @account_details = Crm::AsyncAccountDetailsClient.new(request_client: request_client)
        @account_token = Crm::AsyncAccountTokenClient.new(request_client: request_client)
        @accounts = Crm::AsyncAccountsClient.new(request_client: request_client)
        @async_passthrough = Crm::AsyncAsyncPassthroughClient.new(request_client: request_client)
        @audit_trail = Crm::AsyncAuditTrailClient.new(request_client: request_client)
        @available_actions = Crm::AsyncAvailableActionsClient.new(request_client: request_client)
        @contacts = Crm::AsyncContactsClient.new(request_client: request_client)
        @custom_object_classes = Crm::AsyncCustomObjectClassesClient.new(request_client: request_client)
        @association_types = Crm::AsyncAssociationTypesClient.new(request_client: request_client)
        @custom_objects = Crm::AsyncCustomObjectsClient.new(request_client: request_client)
        @associations = Crm::AsyncAssociationsClient.new(request_client: request_client)
        @delete_account = Crm::AsyncDeleteAccountClient.new(request_client: request_client)
        @engagement_types = Crm::AsyncEngagementTypesClient.new(request_client: request_client)
        @engagements = Crm::AsyncEngagementsClient.new(request_client: request_client)
        @generate_key = Crm::AsyncGenerateKeyClient.new(request_client: request_client)
        @issues = Crm::AsyncIssuesClient.new(request_client: request_client)
        @leads = Crm::AsyncLeadsClient.new(request_client: request_client)
        @link_token = Crm::AsyncLinkTokenClient.new(request_client: request_client)
        @linked_accounts = Crm::AsyncLinkedAccountsClient.new(request_client: request_client)
        @notes = Crm::AsyncNotesClient.new(request_client: request_client)
        @opportunities = Crm::AsyncOpportunitiesClient.new(request_client: request_client)
        @passthrough = Crm::AsyncPassthroughClient.new(request_client: request_client)
        @regenerate_key = Crm::AsyncRegenerateKeyClient.new(request_client: request_client)
        @selective_sync = Crm::AsyncSelectiveSyncClient.new(request_client: request_client)
        @stages = Crm::AsyncStagesClient.new(request_client: request_client)
        @sync_status = Crm::AsyncSyncStatusClient.new(request_client: request_client)
        @force_resync = Crm::AsyncForceResyncClient.new(request_client: request_client)
        @tasks = Crm::AsyncTasksClient.new(request_client: request_client)
        @users = Crm::AsyncUsersClient.new(request_client: request_client)
        @webhook_receivers = Crm::AsyncWebhookReceiversClient.new(request_client: request_client)
      end
    end
  end
end
