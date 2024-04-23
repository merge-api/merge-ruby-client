# frozen_string_literal: true

require_relative "../../requests"
require_relative "account_details/client"
require_relative "account_token/client"
require_relative "accounting_periods/client"
require_relative "accounts/client"
require_relative "addresses/client"
require_relative "async_passthrough/client"
require_relative "attachments/client"
require_relative "audit_trail/client"
require_relative "available_actions/client"
require_relative "balance_sheets/client"
require_relative "cash_flow_statements/client"
require_relative "company_info/client"
require_relative "contacts/client"
require_relative "credit_notes/client"
require_relative "scopes/client"
require_relative "delete_account/client"
require_relative "expenses/client"
require_relative "field_mapping/client"
require_relative "generate_key/client"
require_relative "income_statements/client"
require_relative "invoices/client"
require_relative "issues/client"
require_relative "items/client"
require_relative "journal_entries/client"
require_relative "link_token/client"
require_relative "linked_accounts/client"
require_relative "passthrough/client"
require_relative "payments/client"
require_relative "phone_numbers/client"
require_relative "purchase_orders/client"
require_relative "regenerate_key/client"
require_relative "selective_sync/client"
require_relative "sync_status/client"
require_relative "force_resync/client"
require_relative "tax_rates/client"
require_relative "tracking_categories/client"
require_relative "transactions/client"
require_relative "vendor_credits/client"
require_relative "webhook_receivers/client"

module Merge
  module Accounting
    class Client
      # @return [Merge::Accounting::AccountDetailsClient]
      attr_reader :account_details
      # @return [Merge::Accounting::AccountTokenClient]
      attr_reader :account_token
      # @return [Merge::Accounting::AccountingPeriodsClient]
      attr_reader :accounting_periods
      # @return [Merge::Accounting::AccountsClient]
      attr_reader :accounts
      # @return [Merge::Accounting::AddressesClient]
      attr_reader :addresses
      # @return [Merge::Accounting::AsyncPassthroughClient]
      attr_reader :async_passthrough
      # @return [Merge::Accounting::AttachmentsClient]
      attr_reader :attachments
      # @return [Merge::Accounting::AuditTrailClient]
      attr_reader :audit_trail
      # @return [Merge::Accounting::AvailableActionsClient]
      attr_reader :available_actions
      # @return [Merge::Accounting::BalanceSheetsClient]
      attr_reader :balance_sheets
      # @return [Merge::Accounting::CashFlowStatementsClient]
      attr_reader :cash_flow_statements
      # @return [Merge::Accounting::CompanyInfoClient]
      attr_reader :company_info
      # @return [Merge::Accounting::ContactsClient]
      attr_reader :contacts
      # @return [Merge::Accounting::CreditNotesClient]
      attr_reader :credit_notes
      # @return [Merge::Accounting::ScopesClient]
      attr_reader :scopes
      # @return [Merge::Accounting::DeleteAccountClient]
      attr_reader :delete_account
      # @return [Merge::Accounting::ExpensesClient]
      attr_reader :expenses
      # @return [Merge::Accounting::FieldMappingClient]
      attr_reader :field_mapping
      # @return [Merge::Accounting::GenerateKeyClient]
      attr_reader :generate_key
      # @return [Merge::Accounting::IncomeStatementsClient]
      attr_reader :income_statements
      # @return [Merge::Accounting::InvoicesClient]
      attr_reader :invoices
      # @return [Merge::Accounting::IssuesClient]
      attr_reader :issues
      # @return [Merge::Accounting::ItemsClient]
      attr_reader :items
      # @return [Merge::Accounting::JournalEntriesClient]
      attr_reader :journal_entries
      # @return [Merge::Accounting::LinkTokenClient]
      attr_reader :link_token
      # @return [Merge::Accounting::LinkedAccountsClient]
      attr_reader :linked_accounts
      # @return [Merge::Accounting::PassthroughClient]
      attr_reader :passthrough
      # @return [Merge::Accounting::PaymentsClient]
      attr_reader :payments
      # @return [Merge::Accounting::PhoneNumbersClient]
      attr_reader :phone_numbers
      # @return [Merge::Accounting::PurchaseOrdersClient]
      attr_reader :purchase_orders
      # @return [Merge::Accounting::RegenerateKeyClient]
      attr_reader :regenerate_key
      # @return [Merge::Accounting::SelectiveSyncClient]
      attr_reader :selective_sync
      # @return [Merge::Accounting::SyncStatusClient]
      attr_reader :sync_status
      # @return [Merge::Accounting::ForceResyncClient]
      attr_reader :force_resync
      # @return [Merge::Accounting::TaxRatesClient]
      attr_reader :tax_rates
      # @return [Merge::Accounting::TrackingCategoriesClient]
      attr_reader :tracking_categories
      # @return [Merge::Accounting::TransactionsClient]
      attr_reader :transactions
      # @return [Merge::Accounting::VendorCreditsClient]
      attr_reader :vendor_credits
      # @return [Merge::Accounting::WebhookReceiversClient]
      attr_reader :webhook_receivers

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Accounting::Client]
      def initialize(request_client:)
        @account_details = Merge::Accounting::AccountDetailsClient.new(request_client: request_client)
        @account_token = Merge::Accounting::AccountTokenClient.new(request_client: request_client)
        @accounting_periods = Merge::Accounting::AccountingPeriodsClient.new(request_client: request_client)
        @accounts = Merge::Accounting::AccountsClient.new(request_client: request_client)
        @addresses = Merge::Accounting::AddressesClient.new(request_client: request_client)
        @async_passthrough = Merge::Accounting::AsyncPassthroughClient.new(request_client: request_client)
        @attachments = Merge::Accounting::AttachmentsClient.new(request_client: request_client)
        @audit_trail = Merge::Accounting::AuditTrailClient.new(request_client: request_client)
        @available_actions = Merge::Accounting::AvailableActionsClient.new(request_client: request_client)
        @balance_sheets = Merge::Accounting::BalanceSheetsClient.new(request_client: request_client)
        @cash_flow_statements = Merge::Accounting::CashFlowStatementsClient.new(request_client: request_client)
        @company_info = Merge::Accounting::CompanyInfoClient.new(request_client: request_client)
        @contacts = Merge::Accounting::ContactsClient.new(request_client: request_client)
        @credit_notes = Merge::Accounting::CreditNotesClient.new(request_client: request_client)
        @scopes = Merge::Accounting::ScopesClient.new(request_client: request_client)
        @delete_account = Merge::Accounting::DeleteAccountClient.new(request_client: request_client)
        @expenses = Merge::Accounting::ExpensesClient.new(request_client: request_client)
        @field_mapping = Merge::Accounting::FieldMappingClient.new(request_client: request_client)
        @generate_key = Merge::Accounting::GenerateKeyClient.new(request_client: request_client)
        @income_statements = Merge::Accounting::IncomeStatementsClient.new(request_client: request_client)
        @invoices = Merge::Accounting::InvoicesClient.new(request_client: request_client)
        @issues = Merge::Accounting::IssuesClient.new(request_client: request_client)
        @items = Merge::Accounting::ItemsClient.new(request_client: request_client)
        @journal_entries = Merge::Accounting::JournalEntriesClient.new(request_client: request_client)
        @link_token = Merge::Accounting::LinkTokenClient.new(request_client: request_client)
        @linked_accounts = Merge::Accounting::LinkedAccountsClient.new(request_client: request_client)
        @passthrough = Merge::Accounting::PassthroughClient.new(request_client: request_client)
        @payments = Merge::Accounting::PaymentsClient.new(request_client: request_client)
        @phone_numbers = Merge::Accounting::PhoneNumbersClient.new(request_client: request_client)
        @purchase_orders = Merge::Accounting::PurchaseOrdersClient.new(request_client: request_client)
        @regenerate_key = Merge::Accounting::RegenerateKeyClient.new(request_client: request_client)
        @selective_sync = Merge::Accounting::SelectiveSyncClient.new(request_client: request_client)
        @sync_status = Merge::Accounting::SyncStatusClient.new(request_client: request_client)
        @force_resync = Merge::Accounting::ForceResyncClient.new(request_client: request_client)
        @tax_rates = Merge::Accounting::TaxRatesClient.new(request_client: request_client)
        @tracking_categories = Merge::Accounting::TrackingCategoriesClient.new(request_client: request_client)
        @transactions = Merge::Accounting::TransactionsClient.new(request_client: request_client)
        @vendor_credits = Merge::Accounting::VendorCreditsClient.new(request_client: request_client)
        @webhook_receivers = Merge::Accounting::WebhookReceiversClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [Merge::Accounting::AsyncAccountDetailsClient]
      attr_reader :account_details
      # @return [Merge::Accounting::AsyncAccountTokenClient]
      attr_reader :account_token
      # @return [Merge::Accounting::AsyncAccountingPeriodsClient]
      attr_reader :accounting_periods
      # @return [Merge::Accounting::AsyncAccountsClient]
      attr_reader :accounts
      # @return [Merge::Accounting::AsyncAddressesClient]
      attr_reader :addresses
      # @return [Merge::Accounting::AsyncAsyncPassthroughClient]
      attr_reader :async_passthrough
      # @return [Merge::Accounting::AsyncAttachmentsClient]
      attr_reader :attachments
      # @return [Merge::Accounting::AsyncAuditTrailClient]
      attr_reader :audit_trail
      # @return [Merge::Accounting::AsyncAvailableActionsClient]
      attr_reader :available_actions
      # @return [Merge::Accounting::AsyncBalanceSheetsClient]
      attr_reader :balance_sheets
      # @return [Merge::Accounting::AsyncCashFlowStatementsClient]
      attr_reader :cash_flow_statements
      # @return [Merge::Accounting::AsyncCompanyInfoClient]
      attr_reader :company_info
      # @return [Merge::Accounting::AsyncContactsClient]
      attr_reader :contacts
      # @return [Merge::Accounting::AsyncCreditNotesClient]
      attr_reader :credit_notes
      # @return [Merge::Accounting::AsyncScopesClient]
      attr_reader :scopes
      # @return [Merge::Accounting::AsyncDeleteAccountClient]
      attr_reader :delete_account
      # @return [Merge::Accounting::AsyncExpensesClient]
      attr_reader :expenses
      # @return [Merge::Accounting::AsyncFieldMappingClient]
      attr_reader :field_mapping
      # @return [Merge::Accounting::AsyncGenerateKeyClient]
      attr_reader :generate_key
      # @return [Merge::Accounting::AsyncIncomeStatementsClient]
      attr_reader :income_statements
      # @return [Merge::Accounting::AsyncInvoicesClient]
      attr_reader :invoices
      # @return [Merge::Accounting::AsyncIssuesClient]
      attr_reader :issues
      # @return [Merge::Accounting::AsyncItemsClient]
      attr_reader :items
      # @return [Merge::Accounting::AsyncJournalEntriesClient]
      attr_reader :journal_entries
      # @return [Merge::Accounting::AsyncLinkTokenClient]
      attr_reader :link_token
      # @return [Merge::Accounting::AsyncLinkedAccountsClient]
      attr_reader :linked_accounts
      # @return [Merge::Accounting::AsyncPassthroughClient]
      attr_reader :passthrough
      # @return [Merge::Accounting::AsyncPaymentsClient]
      attr_reader :payments
      # @return [Merge::Accounting::AsyncPhoneNumbersClient]
      attr_reader :phone_numbers
      # @return [Merge::Accounting::AsyncPurchaseOrdersClient]
      attr_reader :purchase_orders
      # @return [Merge::Accounting::AsyncRegenerateKeyClient]
      attr_reader :regenerate_key
      # @return [Merge::Accounting::AsyncSelectiveSyncClient]
      attr_reader :selective_sync
      # @return [Merge::Accounting::AsyncSyncStatusClient]
      attr_reader :sync_status
      # @return [Merge::Accounting::AsyncForceResyncClient]
      attr_reader :force_resync
      # @return [Merge::Accounting::AsyncTaxRatesClient]
      attr_reader :tax_rates
      # @return [Merge::Accounting::AsyncTrackingCategoriesClient]
      attr_reader :tracking_categories
      # @return [Merge::Accounting::AsyncTransactionsClient]
      attr_reader :transactions
      # @return [Merge::Accounting::AsyncVendorCreditsClient]
      attr_reader :vendor_credits
      # @return [Merge::Accounting::AsyncWebhookReceiversClient]
      attr_reader :webhook_receivers

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Accounting::AsyncClient]
      def initialize(request_client:)
        @account_details = Merge::Accounting::AsyncAccountDetailsClient.new(request_client: request_client)
        @account_token = Merge::Accounting::AsyncAccountTokenClient.new(request_client: request_client)
        @accounting_periods = Merge::Accounting::AsyncAccountingPeriodsClient.new(request_client: request_client)
        @accounts = Merge::Accounting::AsyncAccountsClient.new(request_client: request_client)
        @addresses = Merge::Accounting::AsyncAddressesClient.new(request_client: request_client)
        @async_passthrough = Merge::Accounting::AsyncAsyncPassthroughClient.new(request_client: request_client)
        @attachments = Merge::Accounting::AsyncAttachmentsClient.new(request_client: request_client)
        @audit_trail = Merge::Accounting::AsyncAuditTrailClient.new(request_client: request_client)
        @available_actions = Merge::Accounting::AsyncAvailableActionsClient.new(request_client: request_client)
        @balance_sheets = Merge::Accounting::AsyncBalanceSheetsClient.new(request_client: request_client)
        @cash_flow_statements = Merge::Accounting::AsyncCashFlowStatementsClient.new(request_client: request_client)
        @company_info = Merge::Accounting::AsyncCompanyInfoClient.new(request_client: request_client)
        @contacts = Merge::Accounting::AsyncContactsClient.new(request_client: request_client)
        @credit_notes = Merge::Accounting::AsyncCreditNotesClient.new(request_client: request_client)
        @scopes = Merge::Accounting::AsyncScopesClient.new(request_client: request_client)
        @delete_account = Merge::Accounting::AsyncDeleteAccountClient.new(request_client: request_client)
        @expenses = Merge::Accounting::AsyncExpensesClient.new(request_client: request_client)
        @field_mapping = Merge::Accounting::AsyncFieldMappingClient.new(request_client: request_client)
        @generate_key = Merge::Accounting::AsyncGenerateKeyClient.new(request_client: request_client)
        @income_statements = Merge::Accounting::AsyncIncomeStatementsClient.new(request_client: request_client)
        @invoices = Merge::Accounting::AsyncInvoicesClient.new(request_client: request_client)
        @issues = Merge::Accounting::AsyncIssuesClient.new(request_client: request_client)
        @items = Merge::Accounting::AsyncItemsClient.new(request_client: request_client)
        @journal_entries = Merge::Accounting::AsyncJournalEntriesClient.new(request_client: request_client)
        @link_token = Merge::Accounting::AsyncLinkTokenClient.new(request_client: request_client)
        @linked_accounts = Merge::Accounting::AsyncLinkedAccountsClient.new(request_client: request_client)
        @passthrough = Merge::Accounting::AsyncPassthroughClient.new(request_client: request_client)
        @payments = Merge::Accounting::AsyncPaymentsClient.new(request_client: request_client)
        @phone_numbers = Merge::Accounting::AsyncPhoneNumbersClient.new(request_client: request_client)
        @purchase_orders = Merge::Accounting::AsyncPurchaseOrdersClient.new(request_client: request_client)
        @regenerate_key = Merge::Accounting::AsyncRegenerateKeyClient.new(request_client: request_client)
        @selective_sync = Merge::Accounting::AsyncSelectiveSyncClient.new(request_client: request_client)
        @sync_status = Merge::Accounting::AsyncSyncStatusClient.new(request_client: request_client)
        @force_resync = Merge::Accounting::AsyncForceResyncClient.new(request_client: request_client)
        @tax_rates = Merge::Accounting::AsyncTaxRatesClient.new(request_client: request_client)
        @tracking_categories = Merge::Accounting::AsyncTrackingCategoriesClient.new(request_client: request_client)
        @transactions = Merge::Accounting::AsyncTransactionsClient.new(request_client: request_client)
        @vendor_credits = Merge::Accounting::AsyncVendorCreditsClient.new(request_client: request_client)
        @webhook_receivers = Merge::Accounting::AsyncWebhookReceiversClient.new(request_client: request_client)
      end
    end
  end
end
