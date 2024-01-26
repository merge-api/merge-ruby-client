# frozen_string_literal: true

module Merge
  module Accounting
    module Transactions
      # @type [Hash{String => String}]
      TRANSACTIONS_LIST_REQUEST_EXPAND = {
        account: "account",
        account_accounting_period: "account,accounting_period",
        accounting_period: "accounting_period",
        contact: "contact",
        contact_account: "contact,account",
        contact_account_accounting_period: "contact,account,accounting_period",
        contact_accounting_period: "contact,accounting_period",
        line_items: "line_items",
        line_items_account: "line_items,account",
        line_items_account_accounting_period: "line_items,account,accounting_period",
        line_items_accounting_period: "line_items,accounting_period",
        line_items_contact: "line_items,contact",
        line_items_contact_account: "line_items,contact,account",
        line_items_contact_account_accounting_period: "line_items,contact,account,accounting_period",
        line_items_contact_accounting_period: "line_items,contact,accounting_period",
        line_items_tracking_categories: "line_items,tracking_categories",
        line_items_tracking_categories_account: "line_items,tracking_categories,account",
        line_items_tracking_categories_account_accounting_period: "line_items,tracking_categories,account,accounting_period",
        line_items_tracking_categories_accounting_period: "line_items,tracking_categories,accounting_period",
        line_items_tracking_categories_contact: "line_items,tracking_categories,contact",
        line_items_tracking_categories_contact_account: "line_items,tracking_categories,contact,account",
        line_items_tracking_categories_contact_account_accounting_period: "line_items,tracking_categories,contact,account,accounting_period",
        line_items_tracking_categories_contact_accounting_period: "line_items,tracking_categories,contact,accounting_period",
        tracking_categories: "tracking_categories",
        tracking_categories_account: "tracking_categories,account",
        tracking_categories_account_accounting_period: "tracking_categories,account,accounting_period",
        tracking_categories_accounting_period: "tracking_categories,accounting_period",
        tracking_categories_contact: "tracking_categories,contact",
        tracking_categories_contact_account: "tracking_categories,contact,account",
        tracking_categories_contact_account_accounting_period: "tracking_categories,contact,account,accounting_period",
        tracking_categories_contact_accounting_period: "tracking_categories,contact,accounting_period"
      }.frozen
    end
  end
end
