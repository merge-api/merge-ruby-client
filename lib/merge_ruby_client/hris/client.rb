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
require_relative "delete_account/client"
require_relative "dependents/client"
require_relative "employee_payroll_runs/client"
require_relative "employees/client"
require_relative "employer_benefits/client"
require_relative "employments/client"
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
require_relative "selective_sync/client"
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
      attr_reader :account_details, :account_token, :async_passthrough, :audit_trail, :available_actions, :bank_info,
                  :benefits, :companies, :delete_account, :dependents, :employee_payroll_runs, :employees, :employer_benefits, :employments, :generate_key, :groups, :issues, :link_token, :linked_accounts, :locations, :passthrough, :pay_groups, :payroll_runs, :regenerate_key, :selective_sync, :sync_status, :force_resync, :teams, :time_off, :time_off_balances, :timesheet_entries, :webhook_receivers

      # @param request_client [RequestClient]
      # @return [Hris::Client]
      def initialize(request_client:)
        @account_details = Hris::AccountDetailsClient.new(request_client: request_client)
        @account_token = Hris::AccountTokenClient.new(request_client: request_client)
        @async_passthrough = Hris::AsyncPassthroughClient.new(request_client: request_client)
        @audit_trail = Hris::AuditTrailClient.new(request_client: request_client)
        @available_actions = Hris::AvailableActionsClient.new(request_client: request_client)
        @bank_info = Hris::BankInfoClient.new(request_client: request_client)
        @benefits = Hris::BenefitsClient.new(request_client: request_client)
        @companies = Hris::CompaniesClient.new(request_client: request_client)
        @delete_account = Hris::DeleteAccountClient.new(request_client: request_client)
        @dependents = Hris::DependentsClient.new(request_client: request_client)
        @employee_payroll_runs = Hris::EmployeePayrollRunsClient.new(request_client: request_client)
        @employees = Hris::EmployeesClient.new(request_client: request_client)
        @employer_benefits = Hris::EmployerBenefitsClient.new(request_client: request_client)
        @employments = Hris::EmploymentsClient.new(request_client: request_client)
        @generate_key = Hris::GenerateKeyClient.new(request_client: request_client)
        @groups = Hris::GroupsClient.new(request_client: request_client)
        @issues = Hris::IssuesClient.new(request_client: request_client)
        @link_token = Hris::LinkTokenClient.new(request_client: request_client)
        @linked_accounts = Hris::LinkedAccountsClient.new(request_client: request_client)
        @locations = Hris::LocationsClient.new(request_client: request_client)
        @passthrough = Hris::PassthroughClient.new(request_client: request_client)
        @pay_groups = Hris::PayGroupsClient.new(request_client: request_client)
        @payroll_runs = Hris::PayrollRunsClient.new(request_client: request_client)
        @regenerate_key = Hris::RegenerateKeyClient.new(request_client: request_client)
        @selective_sync = Hris::SelectiveSyncClient.new(request_client: request_client)
        @sync_status = Hris::SyncStatusClient.new(request_client: request_client)
        @force_resync = Hris::ForceResyncClient.new(request_client: request_client)
        @teams = Hris::TeamsClient.new(request_client: request_client)
        @time_off = Hris::TimeOffClient.new(request_client: request_client)
        @time_off_balances = Hris::TimeOffBalancesClient.new(request_client: request_client)
        @timesheet_entries = Hris::TimesheetEntriesClient.new(request_client: request_client)
        @webhook_receivers = Hris::WebhookReceiversClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      attr_reader :account_details, :account_token, :async_passthrough, :audit_trail, :available_actions, :bank_info,
                  :benefits, :companies, :delete_account, :dependents, :employee_payroll_runs, :employees, :employer_benefits, :employments, :generate_key, :groups, :issues, :link_token, :linked_accounts, :locations, :passthrough, :pay_groups, :payroll_runs, :regenerate_key, :selective_sync, :sync_status, :force_resync, :teams, :time_off, :time_off_balances, :timesheet_entries, :webhook_receivers

      # @param request_client [RequestClient]
      # @return [Hris::AsyncClient]
      def initialize(request_client:)
        @account_details = Hris::AsyncAccountDetailsClient.new(request_client: request_client)
        @account_token = Hris::AsyncAccountTokenClient.new(request_client: request_client)
        @async_passthrough = Hris::AsyncAsyncPassthroughClient.new(request_client: request_client)
        @audit_trail = Hris::AsyncAuditTrailClient.new(request_client: request_client)
        @available_actions = Hris::AsyncAvailableActionsClient.new(request_client: request_client)
        @bank_info = Hris::AsyncBankInfoClient.new(request_client: request_client)
        @benefits = Hris::AsyncBenefitsClient.new(request_client: request_client)
        @companies = Hris::AsyncCompaniesClient.new(request_client: request_client)
        @delete_account = Hris::AsyncDeleteAccountClient.new(request_client: request_client)
        @dependents = Hris::AsyncDependentsClient.new(request_client: request_client)
        @employee_payroll_runs = Hris::AsyncEmployeePayrollRunsClient.new(request_client: request_client)
        @employees = Hris::AsyncEmployeesClient.new(request_client: request_client)
        @employer_benefits = Hris::AsyncEmployerBenefitsClient.new(request_client: request_client)
        @employments = Hris::AsyncEmploymentsClient.new(request_client: request_client)
        @generate_key = Hris::AsyncGenerateKeyClient.new(request_client: request_client)
        @groups = Hris::AsyncGroupsClient.new(request_client: request_client)
        @issues = Hris::AsyncIssuesClient.new(request_client: request_client)
        @link_token = Hris::AsyncLinkTokenClient.new(request_client: request_client)
        @linked_accounts = Hris::AsyncLinkedAccountsClient.new(request_client: request_client)
        @locations = Hris::AsyncLocationsClient.new(request_client: request_client)
        @passthrough = Hris::AsyncPassthroughClient.new(request_client: request_client)
        @pay_groups = Hris::AsyncPayGroupsClient.new(request_client: request_client)
        @payroll_runs = Hris::AsyncPayrollRunsClient.new(request_client: request_client)
        @regenerate_key = Hris::AsyncRegenerateKeyClient.new(request_client: request_client)
        @selective_sync = Hris::AsyncSelectiveSyncClient.new(request_client: request_client)
        @sync_status = Hris::AsyncSyncStatusClient.new(request_client: request_client)
        @force_resync = Hris::AsyncForceResyncClient.new(request_client: request_client)
        @teams = Hris::AsyncTeamsClient.new(request_client: request_client)
        @time_off = Hris::AsyncTimeOffClient.new(request_client: request_client)
        @time_off_balances = Hris::AsyncTimeOffBalancesClient.new(request_client: request_client)
        @timesheet_entries = Hris::AsyncTimesheetEntriesClient.new(request_client: request_client)
        @webhook_receivers = Hris::AsyncWebhookReceiversClient.new(request_client: request_client)
      end
    end
  end
end
