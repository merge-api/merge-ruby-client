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
require_relative "scopes/client"
require_relative "delete_account/client"
require_relative "engagement_types/client"
require_relative "engagements/client"
require_relative "field_mapping/client"
require_relative "generate_key/client"
require_relative "issues/client"
require_relative "leads/client"
require_relative "link_token/client"
require_relative "linked_accounts/client"
require_relative "notes/client"
require_relative "opportunities/client"
require_relative "passthrough/client"
require_relative "regenerate_key/client"
require_relative "stages/client"
require_relative "sync_status/client"
require_relative "force_resync/client"
require_relative "tasks/client"
require_relative "users/client"
require_relative "webhook_receivers/client"

module Merge
  module Crm
    class Client
      # @return [Merge::Crm::AccountDetailsClient]
      attr_reader :account_details
      # @return [Merge::Crm::AccountTokenClient]
      attr_reader :account_token
      # @return [Merge::Crm::AccountsClient]
      attr_reader :accounts
      # @return [Merge::Crm::AsyncPassthroughClient]
      attr_reader :async_passthrough
      # @return [Merge::Crm::AuditTrailClient]
      attr_reader :audit_trail
      # @return [Merge::Crm::AvailableActionsClient]
      attr_reader :available_actions
      # @return [Merge::Crm::ContactsClient]
      attr_reader :contacts
      # @return [Merge::Crm::CustomObjectClassesClient]
      attr_reader :custom_object_classes
      # @return [Merge::Crm::AssociationTypesClient]
      attr_reader :association_types
      # @return [Merge::Crm::CustomObjectsClient]
      attr_reader :custom_objects
      # @return [Merge::Crm::AssociationsClient]
      attr_reader :associations
      # @return [Merge::Crm::ScopesClient]
      attr_reader :scopes
      # @return [Merge::Crm::DeleteAccountClient]
      attr_reader :delete_account
      # @return [Merge::Crm::EngagementTypesClient]
      attr_reader :engagement_types
      # @return [Merge::Crm::EngagementsClient]
      attr_reader :engagements
      # @return [Merge::Crm::FieldMappingClient]
      attr_reader :field_mapping
      # @return [Merge::Crm::GenerateKeyClient]
      attr_reader :generate_key
      # @return [Merge::Crm::IssuesClient]
      attr_reader :issues
      # @return [Merge::Crm::LeadsClient]
      attr_reader :leads
      # @return [Merge::Crm::LinkTokenClient]
      attr_reader :link_token
      # @return [Merge::Crm::LinkedAccountsClient]
      attr_reader :linked_accounts
      # @return [Merge::Crm::NotesClient]
      attr_reader :notes
      # @return [Merge::Crm::OpportunitiesClient]
      attr_reader :opportunities
      # @return [Merge::Crm::PassthroughClient]
      attr_reader :passthrough
      # @return [Merge::Crm::RegenerateKeyClient]
      attr_reader :regenerate_key
      # @return [Merge::Crm::StagesClient]
      attr_reader :stages
      # @return [Merge::Crm::SyncStatusClient]
      attr_reader :sync_status
      # @return [Merge::Crm::ForceResyncClient]
      attr_reader :force_resync
      # @return [Merge::Crm::TasksClient]
      attr_reader :tasks
      # @return [Merge::Crm::UsersClient]
      attr_reader :users
      # @return [Merge::Crm::WebhookReceiversClient]
      attr_reader :webhook_receivers

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Crm::Client]
      def initialize(request_client:)
        @account_details = Merge::Crm::AccountDetailsClient.new(request_client: request_client)
        @account_token = Merge::Crm::AccountTokenClient.new(request_client: request_client)
        @accounts = Merge::Crm::AccountsClient.new(request_client: request_client)
        @async_passthrough = Merge::Crm::AsyncPassthroughClient.new(request_client: request_client)
        @audit_trail = Merge::Crm::AuditTrailClient.new(request_client: request_client)
        @available_actions = Merge::Crm::AvailableActionsClient.new(request_client: request_client)
        @contacts = Merge::Crm::ContactsClient.new(request_client: request_client)
        @custom_object_classes = Merge::Crm::CustomObjectClassesClient.new(request_client: request_client)
        @association_types = Merge::Crm::AssociationTypesClient.new(request_client: request_client)
        @custom_objects = Merge::Crm::CustomObjectsClient.new(request_client: request_client)
        @associations = Merge::Crm::AssociationsClient.new(request_client: request_client)
        @scopes = Merge::Crm::ScopesClient.new(request_client: request_client)
        @delete_account = Merge::Crm::DeleteAccountClient.new(request_client: request_client)
        @engagement_types = Merge::Crm::EngagementTypesClient.new(request_client: request_client)
        @engagements = Merge::Crm::EngagementsClient.new(request_client: request_client)
        @field_mapping = Merge::Crm::FieldMappingClient.new(request_client: request_client)
        @generate_key = Merge::Crm::GenerateKeyClient.new(request_client: request_client)
        @issues = Merge::Crm::IssuesClient.new(request_client: request_client)
        @leads = Merge::Crm::LeadsClient.new(request_client: request_client)
        @link_token = Merge::Crm::LinkTokenClient.new(request_client: request_client)
        @linked_accounts = Merge::Crm::LinkedAccountsClient.new(request_client: request_client)
        @notes = Merge::Crm::NotesClient.new(request_client: request_client)
        @opportunities = Merge::Crm::OpportunitiesClient.new(request_client: request_client)
        @passthrough = Merge::Crm::PassthroughClient.new(request_client: request_client)
        @regenerate_key = Merge::Crm::RegenerateKeyClient.new(request_client: request_client)
        @stages = Merge::Crm::StagesClient.new(request_client: request_client)
        @sync_status = Merge::Crm::SyncStatusClient.new(request_client: request_client)
        @force_resync = Merge::Crm::ForceResyncClient.new(request_client: request_client)
        @tasks = Merge::Crm::TasksClient.new(request_client: request_client)
        @users = Merge::Crm::UsersClient.new(request_client: request_client)
        @webhook_receivers = Merge::Crm::WebhookReceiversClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [Merge::Crm::AsyncAccountDetailsClient]
      attr_reader :account_details
      # @return [Merge::Crm::AsyncAccountTokenClient]
      attr_reader :account_token
      # @return [Merge::Crm::AsyncAccountsClient]
      attr_reader :accounts
      # @return [Merge::Crm::AsyncAsyncPassthroughClient]
      attr_reader :async_passthrough
      # @return [Merge::Crm::AsyncAuditTrailClient]
      attr_reader :audit_trail
      # @return [Merge::Crm::AsyncAvailableActionsClient]
      attr_reader :available_actions
      # @return [Merge::Crm::AsyncContactsClient]
      attr_reader :contacts
      # @return [Merge::Crm::AsyncCustomObjectClassesClient]
      attr_reader :custom_object_classes
      # @return [Merge::Crm::AsyncAssociationTypesClient]
      attr_reader :association_types
      # @return [Merge::Crm::AsyncCustomObjectsClient]
      attr_reader :custom_objects
      # @return [Merge::Crm::AsyncAssociationsClient]
      attr_reader :associations
      # @return [Merge::Crm::AsyncScopesClient]
      attr_reader :scopes
      # @return [Merge::Crm::AsyncDeleteAccountClient]
      attr_reader :delete_account
      # @return [Merge::Crm::AsyncEngagementTypesClient]
      attr_reader :engagement_types
      # @return [Merge::Crm::AsyncEngagementsClient]
      attr_reader :engagements
      # @return [Merge::Crm::AsyncFieldMappingClient]
      attr_reader :field_mapping
      # @return [Merge::Crm::AsyncGenerateKeyClient]
      attr_reader :generate_key
      # @return [Merge::Crm::AsyncIssuesClient]
      attr_reader :issues
      # @return [Merge::Crm::AsyncLeadsClient]
      attr_reader :leads
      # @return [Merge::Crm::AsyncLinkTokenClient]
      attr_reader :link_token
      # @return [Merge::Crm::AsyncLinkedAccountsClient]
      attr_reader :linked_accounts
      # @return [Merge::Crm::AsyncNotesClient]
      attr_reader :notes
      # @return [Merge::Crm::AsyncOpportunitiesClient]
      attr_reader :opportunities
      # @return [Merge::Crm::AsyncPassthroughClient]
      attr_reader :passthrough
      # @return [Merge::Crm::AsyncRegenerateKeyClient]
      attr_reader :regenerate_key
      # @return [Merge::Crm::AsyncStagesClient]
      attr_reader :stages
      # @return [Merge::Crm::AsyncSyncStatusClient]
      attr_reader :sync_status
      # @return [Merge::Crm::AsyncForceResyncClient]
      attr_reader :force_resync
      # @return [Merge::Crm::AsyncTasksClient]
      attr_reader :tasks
      # @return [Merge::Crm::AsyncUsersClient]
      attr_reader :users
      # @return [Merge::Crm::AsyncWebhookReceiversClient]
      attr_reader :webhook_receivers

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Crm::AsyncClient]
      def initialize(request_client:)
        @account_details = Merge::Crm::AsyncAccountDetailsClient.new(request_client: request_client)
        @account_token = Merge::Crm::AsyncAccountTokenClient.new(request_client: request_client)
        @accounts = Merge::Crm::AsyncAccountsClient.new(request_client: request_client)
        @async_passthrough = Merge::Crm::AsyncAsyncPassthroughClient.new(request_client: request_client)
        @audit_trail = Merge::Crm::AsyncAuditTrailClient.new(request_client: request_client)
        @available_actions = Merge::Crm::AsyncAvailableActionsClient.new(request_client: request_client)
        @contacts = Merge::Crm::AsyncContactsClient.new(request_client: request_client)
        @custom_object_classes = Merge::Crm::AsyncCustomObjectClassesClient.new(request_client: request_client)
        @association_types = Merge::Crm::AsyncAssociationTypesClient.new(request_client: request_client)
        @custom_objects = Merge::Crm::AsyncCustomObjectsClient.new(request_client: request_client)
        @associations = Merge::Crm::AsyncAssociationsClient.new(request_client: request_client)
        @scopes = Merge::Crm::AsyncScopesClient.new(request_client: request_client)
        @delete_account = Merge::Crm::AsyncDeleteAccountClient.new(request_client: request_client)
        @engagement_types = Merge::Crm::AsyncEngagementTypesClient.new(request_client: request_client)
        @engagements = Merge::Crm::AsyncEngagementsClient.new(request_client: request_client)
        @field_mapping = Merge::Crm::AsyncFieldMappingClient.new(request_client: request_client)
        @generate_key = Merge::Crm::AsyncGenerateKeyClient.new(request_client: request_client)
        @issues = Merge::Crm::AsyncIssuesClient.new(request_client: request_client)
        @leads = Merge::Crm::AsyncLeadsClient.new(request_client: request_client)
        @link_token = Merge::Crm::AsyncLinkTokenClient.new(request_client: request_client)
        @linked_accounts = Merge::Crm::AsyncLinkedAccountsClient.new(request_client: request_client)
        @notes = Merge::Crm::AsyncNotesClient.new(request_client: request_client)
        @opportunities = Merge::Crm::AsyncOpportunitiesClient.new(request_client: request_client)
        @passthrough = Merge::Crm::AsyncPassthroughClient.new(request_client: request_client)
        @regenerate_key = Merge::Crm::AsyncRegenerateKeyClient.new(request_client: request_client)
        @stages = Merge::Crm::AsyncStagesClient.new(request_client: request_client)
        @sync_status = Merge::Crm::AsyncSyncStatusClient.new(request_client: request_client)
        @force_resync = Merge::Crm::AsyncForceResyncClient.new(request_client: request_client)
        @tasks = Merge::Crm::AsyncTasksClient.new(request_client: request_client)
        @users = Merge::Crm::AsyncUsersClient.new(request_client: request_client)
        @webhook_receivers = Merge::Crm::AsyncWebhookReceiversClient.new(request_client: request_client)
      end
    end
  end
end
