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
require_relative "delete_account/client"
require_relative "expenses/client"
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
      attr_reader :account_details, :account_token, :accounting_periods, :accounts, :addresses, :async_passthrough,
                  :attachments, :audit_trail, :available_actions, :balance_sheets, :cash_flow_statements, :company_info, :contacts, :credit_notes, :delete_account, :expenses, :generate_key, :income_statements, :invoices, :issues, :items, :journal_entries, :link_token, :linked_accounts, :passthrough, :payments, :phone_numbers, :purchase_orders, :regenerate_key, :selective_sync, :sync_status, :force_resync, :tax_rates, :tracking_categories, :transactions, :vendor_credits, :webhook_receivers

      # @param request_client [RequestClient]
      # @return [Accounting::Client]
      def initialize(request_client:)
        @account_details = Accounting::AccountDetailsClient.new(request_client: request_client)
        @account_token = Accounting::AccountTokenClient.new(request_client: request_client)
        @accounting_periods = Accounting::AccountingPeriodsClient.new(request_client: request_client)
        @accounts = Accounting::AccountsClient.new(request_client: request_client)
        @addresses = Accounting::AddressesClient.new(request_client: request_client)
        @async_passthrough = Accounting::AsyncPassthroughClient.new(request_client: request_client)
        @attachments = Accounting::AttachmentsClient.new(request_client: request_client)
        @audit_trail = Accounting::AuditTrailClient.new(request_client: request_client)
        @available_actions = Accounting::AvailableActionsClient.new(request_client: request_client)
        @balance_sheets = Accounting::BalanceSheetsClient.new(request_client: request_client)
        @cash_flow_statements = Accounting::CashFlowStatementsClient.new(request_client: request_client)
        @company_info = Accounting::CompanyInfoClient.new(request_client: request_client)
        @contacts = Accounting::ContactsClient.new(request_client: request_client)
        @credit_notes = Accounting::CreditNotesClient.new(request_client: request_client)
        @delete_account = Accounting::DeleteAccountClient.new(request_client: request_client)
        @expenses = Accounting::ExpensesClient.new(request_client: request_client)
        @generate_key = Accounting::GenerateKeyClient.new(request_client: request_client)
        @income_statements = Accounting::IncomeStatementsClient.new(request_client: request_client)
        @invoices = Accounting::InvoicesClient.new(request_client: request_client)
        @issues = Accounting::IssuesClient.new(request_client: request_client)
        @items = Accounting::ItemsClient.new(request_client: request_client)
        @journal_entries = Accounting::JournalEntriesClient.new(request_client: request_client)
        @link_token = Accounting::LinkTokenClient.new(request_client: request_client)
        @linked_accounts = Accounting::LinkedAccountsClient.new(request_client: request_client)
        @passthrough = Accounting::PassthroughClient.new(request_client: request_client)
        @payments = Accounting::PaymentsClient.new(request_client: request_client)
        @phone_numbers = Accounting::PhoneNumbersClient.new(request_client: request_client)
        @purchase_orders = Accounting::PurchaseOrdersClient.new(request_client: request_client)
        @regenerate_key = Accounting::RegenerateKeyClient.new(request_client: request_client)
        @selective_sync = Accounting::SelectiveSyncClient.new(request_client: request_client)
        @sync_status = Accounting::SyncStatusClient.new(request_client: request_client)
        @force_resync = Accounting::ForceResyncClient.new(request_client: request_client)
        @tax_rates = Accounting::TaxRatesClient.new(request_client: request_client)
        @tracking_categories = Accounting::TrackingCategoriesClient.new(request_client: request_client)
        @transactions = Accounting::TransactionsClient.new(request_client: request_client)
        @vendor_credits = Accounting::VendorCreditsClient.new(request_client: request_client)
        @webhook_receivers = Accounting::WebhookReceiversClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      attr_reader :account_details, :account_token, :accounting_periods, :accounts, :addresses, :async_passthrough,
                  :attachments, :audit_trail, :available_actions, :balance_sheets, :cash_flow_statements, :company_info, :contacts, :credit_notes, :delete_account, :expenses, :generate_key, :income_statements, :invoices, :issues, :items, :journal_entries, :link_token, :linked_accounts, :passthrough, :payments, :phone_numbers, :purchase_orders, :regenerate_key, :selective_sync, :sync_status, :force_resync, :tax_rates, :tracking_categories, :transactions, :vendor_credits, :webhook_receivers

      # @param request_client [RequestClient]
      # @return [Accounting::AsyncClient]
      def initialize(request_client:)
        @account_details = Accounting::AsyncAccountDetailsClient.new(request_client: request_client)
        @account_token = Accounting::AsyncAccountTokenClient.new(request_client: request_client)
        @accounting_periods = Accounting::AsyncAccountingPeriodsClient.new(request_client: request_client)
        @accounts = Accounting::AsyncAccountsClient.new(request_client: request_client)
        @addresses = Accounting::AsyncAddressesClient.new(request_client: request_client)
        @async_passthrough = Accounting::AsyncAsyncPassthroughClient.new(request_client: request_client)
        @attachments = Accounting::AsyncAttachmentsClient.new(request_client: request_client)
        @audit_trail = Accounting::AsyncAuditTrailClient.new(request_client: request_client)
        @available_actions = Accounting::AsyncAvailableActionsClient.new(request_client: request_client)
        @balance_sheets = Accounting::AsyncBalanceSheetsClient.new(request_client: request_client)
        @cash_flow_statements = Accounting::AsyncCashFlowStatementsClient.new(request_client: request_client)
        @company_info = Accounting::AsyncCompanyInfoClient.new(request_client: request_client)
        @contacts = Accounting::AsyncContactsClient.new(request_client: request_client)
        @credit_notes = Accounting::AsyncCreditNotesClient.new(request_client: request_client)
        @delete_account = Accounting::AsyncDeleteAccountClient.new(request_client: request_client)
        @expenses = Accounting::AsyncExpensesClient.new(request_client: request_client)
        @generate_key = Accounting::AsyncGenerateKeyClient.new(request_client: request_client)
        @income_statements = Accounting::AsyncIncomeStatementsClient.new(request_client: request_client)
        @invoices = Accounting::AsyncInvoicesClient.new(request_client: request_client)
        @issues = Accounting::AsyncIssuesClient.new(request_client: request_client)
        @items = Accounting::AsyncItemsClient.new(request_client: request_client)
        @journal_entries = Accounting::AsyncJournalEntriesClient.new(request_client: request_client)
        @link_token = Accounting::AsyncLinkTokenClient.new(request_client: request_client)
        @linked_accounts = Accounting::AsyncLinkedAccountsClient.new(request_client: request_client)
        @passthrough = Accounting::AsyncPassthroughClient.new(request_client: request_client)
        @payments = Accounting::AsyncPaymentsClient.new(request_client: request_client)
        @phone_numbers = Accounting::AsyncPhoneNumbersClient.new(request_client: request_client)
        @purchase_orders = Accounting::AsyncPurchaseOrdersClient.new(request_client: request_client)
        @regenerate_key = Accounting::AsyncRegenerateKeyClient.new(request_client: request_client)
        @selective_sync = Accounting::AsyncSelectiveSyncClient.new(request_client: request_client)
        @sync_status = Accounting::AsyncSyncStatusClient.new(request_client: request_client)
        @force_resync = Accounting::AsyncForceResyncClient.new(request_client: request_client)
        @tax_rates = Accounting::AsyncTaxRatesClient.new(request_client: request_client)
        @tracking_categories = Accounting::AsyncTrackingCategoriesClient.new(request_client: request_client)
        @transactions = Accounting::AsyncTransactionsClient.new(request_client: request_client)
        @vendor_credits = Accounting::AsyncVendorCreditsClient.new(request_client: request_client)
        @webhook_receivers = Accounting::AsyncWebhookReceiversClient.new(request_client: request_client)
      end
    end
  end
end
