# frozen_string_literal: true

module Merge
  module Accounting
    class GeneralLedgerTransactions
      class GeneralLedgerTransactionsRetrieveRequestExpand
        ACCOUNTING_PERIOD = "accounting_period"
        COMPANY = "company"
        COMPANY_ACCOUNTING_PERIOD = "company,accounting_period"
        GENERAL_LEDGER_TRANSACTION_LINES = "general_ledger_transaction_lines"
        GENERAL_LEDGER_TRANSACTION_LINES_ACCOUNTING_PERIOD = "general_ledger_transaction_lines,accounting_period"
        GENERAL_LEDGER_TRANSACTION_LINES_COMPANY = "general_ledger_transaction_lines,company"
        GENERAL_LEDGER_TRANSACTION_LINES_COMPANY_ACCOUNTING_PERIOD = "general_ledger_transaction_lines,company,accounting_period"
        TRACKING_CATEGORIES = "tracking_categories"
        TRACKING_CATEGORIES_ACCOUNTING_PERIOD = "tracking_categories,accounting_period"
        TRACKING_CATEGORIES_COMPANY = "tracking_categories,company"
        TRACKING_CATEGORIES_COMPANY_ACCOUNTING_PERIOD = "tracking_categories,company,accounting_period"
        TRACKING_CATEGORIES_GENERAL_LEDGER_TRANSACTION_LINES = "tracking_categories,general_ledger_transaction_lines"
        TRACKING_CATEGORIES_GENERAL_LEDGER_TRANSACTION_LINES_ACCOUNTING_PERIOD = "tracking_categories,general_ledger_transaction_lines,accounting_period"
        TRACKING_CATEGORIES_GENERAL_LEDGER_TRANSACTION_LINES_COMPANY = "tracking_categories,general_ledger_transaction_lines,company"
        TRACKING_CATEGORIES_GENERAL_LEDGER_TRANSACTION_LINES_COMPANY_ACCOUNTING_PERIOD = "tracking_categories,general_ledger_transaction_lines,company,accounting_period"
      end
    end
  end
end
