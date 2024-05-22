# frozen_string_literal: true

require_relative "../../requests"
require_relative "account_details/client"
require_relative "account_token/client"
require_relative "async_passthrough/client"
require_relative "audit_trail/client"
require_relative "available_actions/client"
require_relative "bank_info/client"
require_relative "benefits/client"
require_relative "companies/client"
require_relative "scopes/client"
require_relative "delete_account/client"
require_relative "dependents/client"
require_relative "employee_payroll_runs/client"
require_relative "employees/client"
require_relative "employer_benefits/client"
require_relative "employments/client"
require_relative "field_mapping/client"
require_relative "generate_key/client"
require_relative "groups/client"
require_relative "issues/client"
require_relative "link_token/client"
require_relative "linked_accounts/client"
require_relative "locations/client"
require_relative "passthrough/client"
require_relative "pay_groups/client"
require_relative "payroll_runs/client"
require_relative "regenerate_key/client"
require_relative "sync_status/client"
require_relative "force_resync/client"
require_relative "teams/client"
require_relative "time_off/client"
require_relative "time_off_balances/client"
require_relative "timesheet_entries/client"
require_relative "webhook_receivers/client"

module Merge
  module Hris
    class Client
      # @return [Merge::Hris::AccountDetailsClient]
      attr_reader :account_details
      # @return [Merge::Hris::AccountTokenClient]
      attr_reader :account_token
      # @return [Merge::Hris::AsyncPassthroughClient]
      attr_reader :async_passthrough
      # @return [Merge::Hris::AuditTrailClient]
      attr_reader :audit_trail
      # @return [Merge::Hris::AvailableActionsClient]
      attr_reader :available_actions
      # @return [Merge::Hris::BankInfoClient]
      attr_reader :bank_info
      # @return [Merge::Hris::BenefitsClient]
      attr_reader :benefits
      # @return [Merge::Hris::CompaniesClient]
      attr_reader :companies
      # @return [Merge::Hris::ScopesClient]
      attr_reader :scopes
      # @return [Merge::Hris::DeleteAccountClient]
      attr_reader :delete_account
      # @return [Merge::Hris::DependentsClient]
      attr_reader :dependents
      # @return [Merge::Hris::EmployeePayrollRunsClient]
      attr_reader :employee_payroll_runs
      # @return [Merge::Hris::EmployeesClient]
      attr_reader :employees
      # @return [Merge::Hris::EmployerBenefitsClient]
      attr_reader :employer_benefits
      # @return [Merge::Hris::EmploymentsClient]
      attr_reader :employments
      # @return [Merge::Hris::FieldMappingClient]
      attr_reader :field_mapping
      # @return [Merge::Hris::GenerateKeyClient]
      attr_reader :generate_key
      # @return [Merge::Hris::GroupsClient]
      attr_reader :groups
      # @return [Merge::Hris::IssuesClient]
      attr_reader :issues
      # @return [Merge::Hris::LinkTokenClient]
      attr_reader :link_token
      # @return [Merge::Hris::LinkedAccountsClient]
      attr_reader :linked_accounts
      # @return [Merge::Hris::LocationsClient]
      attr_reader :locations
      # @return [Merge::Hris::PassthroughClient]
      attr_reader :passthrough
      # @return [Merge::Hris::PayGroupsClient]
      attr_reader :pay_groups
      # @return [Merge::Hris::PayrollRunsClient]
      attr_reader :payroll_runs
      # @return [Merge::Hris::RegenerateKeyClient]
      attr_reader :regenerate_key
      # @return [Merge::Hris::SyncStatusClient]
      attr_reader :sync_status
      # @return [Merge::Hris::ForceResyncClient]
      attr_reader :force_resync
      # @return [Merge::Hris::TeamsClient]
      attr_reader :teams
      # @return [Merge::Hris::TimeOffClient]
      attr_reader :time_off
      # @return [Merge::Hris::TimeOffBalancesClient]
      attr_reader :time_off_balances
      # @return [Merge::Hris::TimesheetEntriesClient]
      attr_reader :timesheet_entries
      # @return [Merge::Hris::WebhookReceiversClient]
      attr_reader :webhook_receivers

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Hris::Client]
      def initialize(request_client:)
        @account_details = Merge::Hris::AccountDetailsClient.new(request_client: request_client)
        @account_token = Merge::Hris::AccountTokenClient.new(request_client: request_client)
        @async_passthrough = Merge::Hris::AsyncPassthroughClient.new(request_client: request_client)
        @audit_trail = Merge::Hris::AuditTrailClient.new(request_client: request_client)
        @available_actions = Merge::Hris::AvailableActionsClient.new(request_client: request_client)
        @bank_info = Merge::Hris::BankInfoClient.new(request_client: request_client)
        @benefits = Merge::Hris::BenefitsClient.new(request_client: request_client)
        @companies = Merge::Hris::CompaniesClient.new(request_client: request_client)
        @scopes = Merge::Hris::ScopesClient.new(request_client: request_client)
        @delete_account = Merge::Hris::DeleteAccountClient.new(request_client: request_client)
        @dependents = Merge::Hris::DependentsClient.new(request_client: request_client)
        @employee_payroll_runs = Merge::Hris::EmployeePayrollRunsClient.new(request_client: request_client)
        @employees = Merge::Hris::EmployeesClient.new(request_client: request_client)
        @employer_benefits = Merge::Hris::EmployerBenefitsClient.new(request_client: request_client)
        @employments = Merge::Hris::EmploymentsClient.new(request_client: request_client)
        @field_mapping = Merge::Hris::FieldMappingClient.new(request_client: request_client)
        @generate_key = Merge::Hris::GenerateKeyClient.new(request_client: request_client)
        @groups = Merge::Hris::GroupsClient.new(request_client: request_client)
        @issues = Merge::Hris::IssuesClient.new(request_client: request_client)
        @link_token = Merge::Hris::LinkTokenClient.new(request_client: request_client)
        @linked_accounts = Merge::Hris::LinkedAccountsClient.new(request_client: request_client)
        @locations = Merge::Hris::LocationsClient.new(request_client: request_client)
        @passthrough = Merge::Hris::PassthroughClient.new(request_client: request_client)
        @pay_groups = Merge::Hris::PayGroupsClient.new(request_client: request_client)
        @payroll_runs = Merge::Hris::PayrollRunsClient.new(request_client: request_client)
        @regenerate_key = Merge::Hris::RegenerateKeyClient.new(request_client: request_client)
        @sync_status = Merge::Hris::SyncStatusClient.new(request_client: request_client)
        @force_resync = Merge::Hris::ForceResyncClient.new(request_client: request_client)
        @teams = Merge::Hris::TeamsClient.new(request_client: request_client)
        @time_off = Merge::Hris::TimeOffClient.new(request_client: request_client)
        @time_off_balances = Merge::Hris::TimeOffBalancesClient.new(request_client: request_client)
        @timesheet_entries = Merge::Hris::TimesheetEntriesClient.new(request_client: request_client)
        @webhook_receivers = Merge::Hris::WebhookReceiversClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [Merge::Hris::AsyncAccountDetailsClient]
      attr_reader :account_details
      # @return [Merge::Hris::AsyncAccountTokenClient]
      attr_reader :account_token
      # @return [Merge::Hris::AsyncAsyncPassthroughClient]
      attr_reader :async_passthrough
      # @return [Merge::Hris::AsyncAuditTrailClient]
      attr_reader :audit_trail
      # @return [Merge::Hris::AsyncAvailableActionsClient]
      attr_reader :available_actions
      # @return [Merge::Hris::AsyncBankInfoClient]
      attr_reader :bank_info
      # @return [Merge::Hris::AsyncBenefitsClient]
      attr_reader :benefits
      # @return [Merge::Hris::AsyncCompaniesClient]
      attr_reader :companies
      # @return [Merge::Hris::AsyncScopesClient]
      attr_reader :scopes
      # @return [Merge::Hris::AsyncDeleteAccountClient]
      attr_reader :delete_account
      # @return [Merge::Hris::AsyncDependentsClient]
      attr_reader :dependents
      # @return [Merge::Hris::AsyncEmployeePayrollRunsClient]
      attr_reader :employee_payroll_runs
      # @return [Merge::Hris::AsyncEmployeesClient]
      attr_reader :employees
      # @return [Merge::Hris::AsyncEmployerBenefitsClient]
      attr_reader :employer_benefits
      # @return [Merge::Hris::AsyncEmploymentsClient]
      attr_reader :employments
      # @return [Merge::Hris::AsyncFieldMappingClient]
      attr_reader :field_mapping
      # @return [Merge::Hris::AsyncGenerateKeyClient]
      attr_reader :generate_key
      # @return [Merge::Hris::AsyncGroupsClient]
      attr_reader :groups
      # @return [Merge::Hris::AsyncIssuesClient]
      attr_reader :issues
      # @return [Merge::Hris::AsyncLinkTokenClient]
      attr_reader :link_token
      # @return [Merge::Hris::AsyncLinkedAccountsClient]
      attr_reader :linked_accounts
      # @return [Merge::Hris::AsyncLocationsClient]
      attr_reader :locations
      # @return [Merge::Hris::AsyncPassthroughClient]
      attr_reader :passthrough
      # @return [Merge::Hris::AsyncPayGroupsClient]
      attr_reader :pay_groups
      # @return [Merge::Hris::AsyncPayrollRunsClient]
      attr_reader :payroll_runs
      # @return [Merge::Hris::AsyncRegenerateKeyClient]
      attr_reader :regenerate_key
      # @return [Merge::Hris::AsyncSyncStatusClient]
      attr_reader :sync_status
      # @return [Merge::Hris::AsyncForceResyncClient]
      attr_reader :force_resync
      # @return [Merge::Hris::AsyncTeamsClient]
      attr_reader :teams
      # @return [Merge::Hris::AsyncTimeOffClient]
      attr_reader :time_off
      # @return [Merge::Hris::AsyncTimeOffBalancesClient]
      attr_reader :time_off_balances
      # @return [Merge::Hris::AsyncTimesheetEntriesClient]
      attr_reader :timesheet_entries
      # @return [Merge::Hris::AsyncWebhookReceiversClient]
      attr_reader :webhook_receivers

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Hris::AsyncClient]
      def initialize(request_client:)
        @account_details = Merge::Hris::AsyncAccountDetailsClient.new(request_client: request_client)
        @account_token = Merge::Hris::AsyncAccountTokenClient.new(request_client: request_client)
        @async_passthrough = Merge::Hris::AsyncAsyncPassthroughClient.new(request_client: request_client)
        @audit_trail = Merge::Hris::AsyncAuditTrailClient.new(request_client: request_client)
        @available_actions = Merge::Hris::AsyncAvailableActionsClient.new(request_client: request_client)
        @bank_info = Merge::Hris::AsyncBankInfoClient.new(request_client: request_client)
        @benefits = Merge::Hris::AsyncBenefitsClient.new(request_client: request_client)
        @companies = Merge::Hris::AsyncCompaniesClient.new(request_client: request_client)
        @scopes = Merge::Hris::AsyncScopesClient.new(request_client: request_client)
        @delete_account = Merge::Hris::AsyncDeleteAccountClient.new(request_client: request_client)
        @dependents = Merge::Hris::AsyncDependentsClient.new(request_client: request_client)
        @employee_payroll_runs = Merge::Hris::AsyncEmployeePayrollRunsClient.new(request_client: request_client)
        @employees = Merge::Hris::AsyncEmployeesClient.new(request_client: request_client)
        @employer_benefits = Merge::Hris::AsyncEmployerBenefitsClient.new(request_client: request_client)
        @employments = Merge::Hris::AsyncEmploymentsClient.new(request_client: request_client)
        @field_mapping = Merge::Hris::AsyncFieldMappingClient.new(request_client: request_client)
        @generate_key = Merge::Hris::AsyncGenerateKeyClient.new(request_client: request_client)
        @groups = Merge::Hris::AsyncGroupsClient.new(request_client: request_client)
        @issues = Merge::Hris::AsyncIssuesClient.new(request_client: request_client)
        @link_token = Merge::Hris::AsyncLinkTokenClient.new(request_client: request_client)
        @linked_accounts = Merge::Hris::AsyncLinkedAccountsClient.new(request_client: request_client)
        @locations = Merge::Hris::AsyncLocationsClient.new(request_client: request_client)
        @passthrough = Merge::Hris::AsyncPassthroughClient.new(request_client: request_client)
        @pay_groups = Merge::Hris::AsyncPayGroupsClient.new(request_client: request_client)
        @payroll_runs = Merge::Hris::AsyncPayrollRunsClient.new(request_client: request_client)
        @regenerate_key = Merge::Hris::AsyncRegenerateKeyClient.new(request_client: request_client)
        @sync_status = Merge::Hris::AsyncSyncStatusClient.new(request_client: request_client)
        @force_resync = Merge::Hris::AsyncForceResyncClient.new(request_client: request_client)
        @teams = Merge::Hris::AsyncTeamsClient.new(request_client: request_client)
        @time_off = Merge::Hris::AsyncTimeOffClient.new(request_client: request_client)
        @time_off_balances = Merge::Hris::AsyncTimeOffBalancesClient.new(request_client: request_client)
        @timesheet_entries = Merge::Hris::AsyncTimesheetEntriesClient.new(request_client: request_client)
        @webhook_receivers = Merge::Hris::AsyncWebhookReceiversClient.new(request_client: request_client)
      end
    end
  end
end
