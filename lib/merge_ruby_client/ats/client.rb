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
require_relative "delete_account/client"
require_relative "departments/client"
require_relative "eeocs/client"
require_relative "generate_key/client"
require_relative "interviews/client"
require_relative "issues/client"
require_relative "job_interview_stages/client"
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
      attr_reader :account_details, :account_token, :activities, :applications, :async_passthrough, :attachments,
                  :audit_trail, :available_actions, :candidates, :delete_account, :departments, :eeocs, :generate_key, :interviews, :issues, :job_interview_stages, :jobs, :link_token, :linked_accounts, :offers, :offices, :passthrough, :regenerate_key, :reject_reasons, :scorecards, :selective_sync, :sync_status, :force_resync, :tags, :users, :webhook_receivers

      # @param request_client [RequestClient]
      # @return [Ats::Client]
      def initialize(request_client:)
        @account_details = Ats::AccountDetailsClient.new(request_client: request_client)
        @account_token = Ats::AccountTokenClient.new(request_client: request_client)
        @activities = Ats::ActivitiesClient.new(request_client: request_client)
        @applications = Ats::ApplicationsClient.new(request_client: request_client)
        @async_passthrough = Ats::AsyncPassthroughClient.new(request_client: request_client)
        @attachments = Ats::AttachmentsClient.new(request_client: request_client)
        @audit_trail = Ats::AuditTrailClient.new(request_client: request_client)
        @available_actions = Ats::AvailableActionsClient.new(request_client: request_client)
        @candidates = Ats::CandidatesClient.new(request_client: request_client)
        @delete_account = Ats::DeleteAccountClient.new(request_client: request_client)
        @departments = Ats::DepartmentsClient.new(request_client: request_client)
        @eeocs = Ats::EeocsClient.new(request_client: request_client)
        @generate_key = Ats::GenerateKeyClient.new(request_client: request_client)
        @interviews = Ats::InterviewsClient.new(request_client: request_client)
        @issues = Ats::IssuesClient.new(request_client: request_client)
        @job_interview_stages = Ats::JobInterviewStagesClient.new(request_client: request_client)
        @jobs = Ats::JobsClient.new(request_client: request_client)
        @link_token = Ats::LinkTokenClient.new(request_client: request_client)
        @linked_accounts = Ats::LinkedAccountsClient.new(request_client: request_client)
        @offers = Ats::OffersClient.new(request_client: request_client)
        @offices = Ats::OfficesClient.new(request_client: request_client)
        @passthrough = Ats::PassthroughClient.new(request_client: request_client)
        @regenerate_key = Ats::RegenerateKeyClient.new(request_client: request_client)
        @reject_reasons = Ats::RejectReasonsClient.new(request_client: request_client)
        @scorecards = Ats::ScorecardsClient.new(request_client: request_client)
        @selective_sync = Ats::SelectiveSyncClient.new(request_client: request_client)
        @sync_status = Ats::SyncStatusClient.new(request_client: request_client)
        @force_resync = Ats::ForceResyncClient.new(request_client: request_client)
        @tags = Ats::TagsClient.new(request_client: request_client)
        @users = Ats::UsersClient.new(request_client: request_client)
        @webhook_receivers = Ats::WebhookReceiversClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      attr_reader :account_details, :account_token, :activities, :applications, :async_passthrough, :attachments,
                  :audit_trail, :available_actions, :candidates, :delete_account, :departments, :eeocs, :generate_key, :interviews, :issues, :job_interview_stages, :jobs, :link_token, :linked_accounts, :offers, :offices, :passthrough, :regenerate_key, :reject_reasons, :scorecards, :selective_sync, :sync_status, :force_resync, :tags, :users, :webhook_receivers

      # @param request_client [RequestClient]
      # @return [Ats::AsyncClient]
      def initialize(request_client:)
        @account_details = Ats::AsyncAccountDetailsClient.new(request_client: request_client)
        @account_token = Ats::AsyncAccountTokenClient.new(request_client: request_client)
        @activities = Ats::AsyncActivitiesClient.new(request_client: request_client)
        @applications = Ats::AsyncApplicationsClient.new(request_client: request_client)
        @async_passthrough = Ats::AsyncAsyncPassthroughClient.new(request_client: request_client)
        @attachments = Ats::AsyncAttachmentsClient.new(request_client: request_client)
        @audit_trail = Ats::AsyncAuditTrailClient.new(request_client: request_client)
        @available_actions = Ats::AsyncAvailableActionsClient.new(request_client: request_client)
        @candidates = Ats::AsyncCandidatesClient.new(request_client: request_client)
        @delete_account = Ats::AsyncDeleteAccountClient.new(request_client: request_client)
        @departments = Ats::AsyncDepartmentsClient.new(request_client: request_client)
        @eeocs = Ats::AsyncEeocsClient.new(request_client: request_client)
        @generate_key = Ats::AsyncGenerateKeyClient.new(request_client: request_client)
        @interviews = Ats::AsyncInterviewsClient.new(request_client: request_client)
        @issues = Ats::AsyncIssuesClient.new(request_client: request_client)
        @job_interview_stages = Ats::AsyncJobInterviewStagesClient.new(request_client: request_client)
        @jobs = Ats::AsyncJobsClient.new(request_client: request_client)
        @link_token = Ats::AsyncLinkTokenClient.new(request_client: request_client)
        @linked_accounts = Ats::AsyncLinkedAccountsClient.new(request_client: request_client)
        @offers = Ats::AsyncOffersClient.new(request_client: request_client)
        @offices = Ats::AsyncOfficesClient.new(request_client: request_client)
        @passthrough = Ats::AsyncPassthroughClient.new(request_client: request_client)
        @regenerate_key = Ats::AsyncRegenerateKeyClient.new(request_client: request_client)
        @reject_reasons = Ats::AsyncRejectReasonsClient.new(request_client: request_client)
        @scorecards = Ats::AsyncScorecardsClient.new(request_client: request_client)
        @selective_sync = Ats::AsyncSelectiveSyncClient.new(request_client: request_client)
        @sync_status = Ats::AsyncSyncStatusClient.new(request_client: request_client)
        @force_resync = Ats::AsyncForceResyncClient.new(request_client: request_client)
        @tags = Ats::AsyncTagsClient.new(request_client: request_client)
        @users = Ats::AsyncUsersClient.new(request_client: request_client)
        @webhook_receivers = Ats::AsyncWebhookReceiversClient.new(request_client: request_client)
      end
    end
  end
end
