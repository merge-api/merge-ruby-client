# frozen_string_literal: true

module Merge
  module Accounting
    class Transactions
      class TransactionsRetrieveRequestExpand
        ACCOUNT = "account"
        ACCOUNT_ACCOUNTING_PERIOD = "account,accounting_period"
        ACCOUNTING_PERIOD = "accounting_period"
        CONTACT = "contact"
        CONTACT_ACCOUNT = "contact,account"
        CONTACT_ACCOUNT_ACCOUNTING_PERIOD = "contact,account,accounting_period"
        CONTACT_ACCOUNTING_PERIOD = "contact,accounting_period"
        LINE_ITEMS = "line_items"
        LINE_ITEMS_ACCOUNT = "line_items,account"
        LINE_ITEMS_ACCOUNT_ACCOUNTING_PERIOD = "line_items,account,accounting_period"
        LINE_ITEMS_ACCOUNTING_PERIOD = "line_items,accounting_period"
        LINE_ITEMS_CONTACT = "line_items,contact"
        LINE_ITEMS_CONTACT_ACCOUNT = "line_items,contact,account"
        LINE_ITEMS_CONTACT_ACCOUNT_ACCOUNTING_PERIOD = "line_items,contact,account,accounting_period"
        LINE_ITEMS_CONTACT_ACCOUNTING_PERIOD = "line_items,contact,accounting_period"
        LINE_ITEMS_TRACKING_CATEGORIES = "line_items,tracking_categories"
        LINE_ITEMS_TRACKING_CATEGORIES_ACCOUNT = "line_items,tracking_categories,account"
        LINE_ITEMS_TRACKING_CATEGORIES_ACCOUNT_ACCOUNTING_PERIOD = "line_items,tracking_categories,account,accounting_period"
        LINE_ITEMS_TRACKING_CATEGORIES_ACCOUNTING_PERIOD = "line_items,tracking_categories,accounting_period"
        LINE_ITEMS_TRACKING_CATEGORIES_CONTACT = "line_items,tracking_categories,contact"
        LINE_ITEMS_TRACKING_CATEGORIES_CONTACT_ACCOUNT = "line_items,tracking_categories,contact,account"
        LINE_ITEMS_TRACKING_CATEGORIES_CONTACT_ACCOUNT_ACCOUNTING_PERIOD = "line_items,tracking_categories,contact,account,accounting_period"
        LINE_ITEMS_TRACKING_CATEGORIES_CONTACT_ACCOUNTING_PERIOD = "line_items,tracking_categories,contact,accounting_period"
        TRACKING_CATEGORIES = "tracking_categories"
        TRACKING_CATEGORIES_ACCOUNT = "tracking_categories,account"
        TRACKING_CATEGORIES_ACCOUNT_ACCOUNTING_PERIOD = "tracking_categories,account,accounting_period"
        TRACKING_CATEGORIES_ACCOUNTING_PERIOD = "tracking_categories,accounting_period"
        TRACKING_CATEGORIES_CONTACT = "tracking_categories,contact"
        TRACKING_CATEGORIES_CONTACT_ACCOUNT = "tracking_categories,contact,account"
        TRACKING_CATEGORIES_CONTACT_ACCOUNT_ACCOUNTING_PERIOD = "tracking_categories,contact,account,accounting_period"
        TRACKING_CATEGORIES_CONTACT_ACCOUNTING_PERIOD = "tracking_categories,contact,accounting_period"
      end
    end
  end
end
