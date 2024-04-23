# frozen_string_literal: true

require_relative "../../requests"
require_relative "account_details/client"
require_relative "account_token/client"
require_relative "activities/client"
require_relative "applications/client"
require_relative "async_passthrough/client"
require_relative "attachments/client"
require_relative "audit_trail/client"
require_relative "available_actions/client"
require_relative "candidates/client"
require_relative "scopes/client"
require_relative "delete_account/client"
require_relative "departments/client"
require_relative "eeocs/client"
require_relative "field_mapping/client"
require_relative "generate_key/client"
require_relative "interviews/client"
require_relative "issues/client"
require_relative "job_interview_stages/client"
require_relative "job_postings/client"
require_relative "jobs/client"
require_relative "link_token/client"
require_relative "linked_accounts/client"
require_relative "offers/client"
require_relative "offices/client"
require_relative "passthrough/client"
require_relative "regenerate_key/client"
require_relative "reject_reasons/client"
require_relative "scorecards/client"
require_relative "selective_sync/client"
require_relative "sync_status/client"
require_relative "force_resync/client"
require_relative "tags/client"
require_relative "users/client"
require_relative "webhook_receivers/client"

module Merge
  module Ats
    class Client
      # @return [Merge::Ats::AccountDetailsClient]
      attr_reader :account_details
      # @return [Merge::Ats::AccountTokenClient]
      attr_reader :account_token
      # @return [Merge::Ats::ActivitiesClient]
      attr_reader :activities
      # @return [Merge::Ats::ApplicationsClient]
      attr_reader :applications
      # @return [Merge::Ats::AsyncPassthroughClient]
      attr_reader :async_passthrough
      # @return [Merge::Ats::AttachmentsClient]
      attr_reader :attachments
      # @return [Merge::Ats::AuditTrailClient]
      attr_reader :audit_trail
      # @return [Merge::Ats::AvailableActionsClient]
      attr_reader :available_actions
      # @return [Merge::Ats::CandidatesClient]
      attr_reader :candidates
      # @return [Merge::Ats::ScopesClient]
      attr_reader :scopes
      # @return [Merge::Ats::DeleteAccountClient]
      attr_reader :delete_account
      # @return [Merge::Ats::DepartmentsClient]
      attr_reader :departments
      # @return [Merge::Ats::EeocsClient]
      attr_reader :eeocs
      # @return [Merge::Ats::FieldMappingClient]
      attr_reader :field_mapping
      # @return [Merge::Ats::GenerateKeyClient]
      attr_reader :generate_key
      # @return [Merge::Ats::InterviewsClient]
      attr_reader :interviews
      # @return [Merge::Ats::IssuesClient]
      attr_reader :issues
      # @return [Merge::Ats::JobInterviewStagesClient]
      attr_reader :job_interview_stages
      # @return [Merge::Ats::JobPostingsClient]
      attr_reader :job_postings
      # @return [Merge::Ats::JobsClient]
      attr_reader :jobs
      # @return [Merge::Ats::LinkTokenClient]
      attr_reader :link_token
      # @return [Merge::Ats::LinkedAccountsClient]
      attr_reader :linked_accounts
      # @return [Merge::Ats::OffersClient]
      attr_reader :offers
      # @return [Merge::Ats::OfficesClient]
      attr_reader :offices
      # @return [Merge::Ats::PassthroughClient]
      attr_reader :passthrough
      # @return [Merge::Ats::RegenerateKeyClient]
      attr_reader :regenerate_key
      # @return [Merge::Ats::RejectReasonsClient]
      attr_reader :reject_reasons
      # @return [Merge::Ats::ScorecardsClient]
      attr_reader :scorecards
      # @return [Merge::Ats::SelectiveSyncClient]
      attr_reader :selective_sync
      # @return [Merge::Ats::SyncStatusClient]
      attr_reader :sync_status
      # @return [Merge::Ats::ForceResyncClient]
      attr_reader :force_resync
      # @return [Merge::Ats::TagsClient]
      attr_reader :tags
      # @return [Merge::Ats::UsersClient]
      attr_reader :users
      # @return [Merge::Ats::WebhookReceiversClient]
      attr_reader :webhook_receivers

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Ats::Client]
      def initialize(request_client:)
        @account_details = Merge::Ats::AccountDetailsClient.new(request_client: request_client)
        @account_token = Merge::Ats::AccountTokenClient.new(request_client: request_client)
        @activities = Merge::Ats::ActivitiesClient.new(request_client: request_client)
        @applications = Merge::Ats::ApplicationsClient.new(request_client: request_client)
        @async_passthrough = Merge::Ats::AsyncPassthroughClient.new(request_client: request_client)
        @attachments = Merge::Ats::AttachmentsClient.new(request_client: request_client)
        @audit_trail = Merge::Ats::AuditTrailClient.new(request_client: request_client)
        @available_actions = Merge::Ats::AvailableActionsClient.new(request_client: request_client)
        @candidates = Merge::Ats::CandidatesClient.new(request_client: request_client)
        @scopes = Merge::Ats::ScopesClient.new(request_client: request_client)
        @delete_account = Merge::Ats::DeleteAccountClient.new(request_client: request_client)
        @departments = Merge::Ats::DepartmentsClient.new(request_client: request_client)
        @eeocs = Merge::Ats::EeocsClient.new(request_client: request_client)
        @field_mapping = Merge::Ats::FieldMappingClient.new(request_client: request_client)
        @generate_key = Merge::Ats::GenerateKeyClient.new(request_client: request_client)
        @interviews = Merge::Ats::InterviewsClient.new(request_client: request_client)
        @issues = Merge::Ats::IssuesClient.new(request_client: request_client)
        @job_interview_stages = Merge::Ats::JobInterviewStagesClient.new(request_client: request_client)
        @job_postings = Merge::Ats::JobPostingsClient.new(request_client: request_client)
        @jobs = Merge::Ats::JobsClient.new(request_client: request_client)
        @link_token = Merge::Ats::LinkTokenClient.new(request_client: request_client)
        @linked_accounts = Merge::Ats::LinkedAccountsClient.new(request_client: request_client)
        @offers = Merge::Ats::OffersClient.new(request_client: request_client)
        @offices = Merge::Ats::OfficesClient.new(request_client: request_client)
        @passthrough = Merge::Ats::PassthroughClient.new(request_client: request_client)
        @regenerate_key = Merge::Ats::RegenerateKeyClient.new(request_client: request_client)
        @reject_reasons = Merge::Ats::RejectReasonsClient.new(request_client: request_client)
        @scorecards = Merge::Ats::ScorecardsClient.new(request_client: request_client)
        @selective_sync = Merge::Ats::SelectiveSyncClient.new(request_client: request_client)
        @sync_status = Merge::Ats::SyncStatusClient.new(request_client: request_client)
        @force_resync = Merge::Ats::ForceResyncClient.new(request_client: request_client)
        @tags = Merge::Ats::TagsClient.new(request_client: request_client)
        @users = Merge::Ats::UsersClient.new(request_client: request_client)
        @webhook_receivers = Merge::Ats::WebhookReceiversClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [Merge::Ats::AsyncAccountDetailsClient]
      attr_reader :account_details
      # @return [Merge::Ats::AsyncAccountTokenClient]
      attr_reader :account_token
      # @return [Merge::Ats::AsyncActivitiesClient]
      attr_reader :activities
      # @return [Merge::Ats::AsyncApplicationsClient]
      attr_reader :applications
      # @return [Merge::Ats::AsyncAsyncPassthroughClient]
      attr_reader :async_passthrough
      # @return [Merge::Ats::AsyncAttachmentsClient]
      attr_reader :attachments
      # @return [Merge::Ats::AsyncAuditTrailClient]
      attr_reader :audit_trail
      # @return [Merge::Ats::AsyncAvailableActionsClient]
      attr_reader :available_actions
      # @return [Merge::Ats::AsyncCandidatesClient]
      attr_reader :candidates
      # @return [Merge::Ats::AsyncScopesClient]
      attr_reader :scopes
      # @return [Merge::Ats::AsyncDeleteAccountClient]
      attr_reader :delete_account
      # @return [Merge::Ats::AsyncDepartmentsClient]
      attr_reader :departments
      # @return [Merge::Ats::AsyncEeocsClient]
      attr_reader :eeocs
      # @return [Merge::Ats::AsyncFieldMappingClient]
      attr_reader :field_mapping
      # @return [Merge::Ats::AsyncGenerateKeyClient]
      attr_reader :generate_key
      # @return [Merge::Ats::AsyncInterviewsClient]
      attr_reader :interviews
      # @return [Merge::Ats::AsyncIssuesClient]
      attr_reader :issues
      # @return [Merge::Ats::AsyncJobInterviewStagesClient]
      attr_reader :job_interview_stages
      # @return [Merge::Ats::AsyncJobPostingsClient]
      attr_reader :job_postings
      # @return [Merge::Ats::AsyncJobsClient]
      attr_reader :jobs
      # @return [Merge::Ats::AsyncLinkTokenClient]
      attr_reader :link_token
      # @return [Merge::Ats::AsyncLinkedAccountsClient]
      attr_reader :linked_accounts
      # @return [Merge::Ats::AsyncOffersClient]
      attr_reader :offers
      # @return [Merge::Ats::AsyncOfficesClient]
      attr_reader :offices
      # @return [Merge::Ats::AsyncPassthroughClient]
      attr_reader :passthrough
      # @return [Merge::Ats::AsyncRegenerateKeyClient]
      attr_reader :regenerate_key
      # @return [Merge::Ats::AsyncRejectReasonsClient]
      attr_reader :reject_reasons
      # @return [Merge::Ats::AsyncScorecardsClient]
      attr_reader :scorecards
      # @return [Merge::Ats::AsyncSelectiveSyncClient]
      attr_reader :selective_sync
      # @return [Merge::Ats::AsyncSyncStatusClient]
      attr_reader :sync_status
      # @return [Merge::Ats::AsyncForceResyncClient]
      attr_reader :force_resync
      # @return [Merge::Ats::AsyncTagsClient]
      attr_reader :tags
      # @return [Merge::Ats::AsyncUsersClient]
      attr_reader :users
      # @return [Merge::Ats::AsyncWebhookReceiversClient]
      attr_reader :webhook_receivers

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Ats::AsyncClient]
      def initialize(request_client:)
        @account_details = Merge::Ats::AsyncAccountDetailsClient.new(request_client: request_client)
        @account_token = Merge::Ats::AsyncAccountTokenClient.new(request_client: request_client)
        @activities = Merge::Ats::AsyncActivitiesClient.new(request_client: request_client)
        @applications = Merge::Ats::AsyncApplicationsClient.new(request_client: request_client)
        @async_passthrough = Merge::Ats::AsyncAsyncPassthroughClient.new(request_client: request_client)
        @attachments = Merge::Ats::AsyncAttachmentsClient.new(request_client: request_client)
        @audit_trail = Merge::Ats::AsyncAuditTrailClient.new(request_client: request_client)
        @available_actions = Merge::Ats::AsyncAvailableActionsClient.new(request_client: request_client)
        @candidates = Merge::Ats::AsyncCandidatesClient.new(request_client: request_client)
        @scopes = Merge::Ats::AsyncScopesClient.new(request_client: request_client)
        @delete_account = Merge::Ats::AsyncDeleteAccountClient.new(request_client: request_client)
        @departments = Merge::Ats::AsyncDepartmentsClient.new(request_client: request_client)
        @eeocs = Merge::Ats::AsyncEeocsClient.new(request_client: request_client)
        @field_mapping = Merge::Ats::AsyncFieldMappingClient.new(request_client: request_client)
        @generate_key = Merge::Ats::AsyncGenerateKeyClient.new(request_client: request_client)
        @interviews = Merge::Ats::AsyncInterviewsClient.new(request_client: request_client)
        @issues = Merge::Ats::AsyncIssuesClient.new(request_client: request_client)
        @job_interview_stages = Merge::Ats::AsyncJobInterviewStagesClient.new(request_client: request_client)
        @job_postings = Merge::Ats::AsyncJobPostingsClient.new(request_client: request_client)
        @jobs = Merge::Ats::AsyncJobsClient.new(request_client: request_client)
        @link_token = Merge::Ats::AsyncLinkTokenClient.new(request_client: request_client)
        @linked_accounts = Merge::Ats::AsyncLinkedAccountsClient.new(request_client: request_client)
        @offers = Merge::Ats::AsyncOffersClient.new(request_client: request_client)
        @offices = Merge::Ats::AsyncOfficesClient.new(request_client: request_client)
        @passthrough = Merge::Ats::AsyncPassthroughClient.new(request_client: request_client)
        @regenerate_key = Merge::Ats::AsyncRegenerateKeyClient.new(request_client: request_client)
        @reject_reasons = Merge::Ats::AsyncRejectReasonsClient.new(request_client: request_client)
        @scorecards = Merge::Ats::AsyncScorecardsClient.new(request_client: request_client)
        @selective_sync = Merge::Ats::AsyncSelectiveSyncClient.new(request_client: request_client)
        @sync_status = Merge::Ats::AsyncSyncStatusClient.new(request_client: request_client)
        @force_resync = Merge::Ats::AsyncForceResyncClient.new(request_client: request_client)
        @tags = Merge::Ats::AsyncTagsClient.new(request_client: request_client)
        @users = Merge::Ats::AsyncUsersClient.new(request_client: request_client)
        @webhook_receivers = Merge::Ats::AsyncWebhookReceiversClient.new(request_client: request_client)
      end
    end
  end
end
