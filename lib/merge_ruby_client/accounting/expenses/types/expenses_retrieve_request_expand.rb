# frozen_string_literal: true

module Merge
  module Accounting
    class Expenses
      # @type [EXPENSES_RETRIEVE_REQUEST_EXPAND]
      EXPENSES_RETRIEVE_REQUEST_EXPAND = {
        account: "account",
        account_accounting_period: "account,accounting_period",
        account_company: "account,company",
        account_company_accounting_period: "account,company,accounting_period",
        account_contact: "account,contact",
        account_contact_accounting_period: "account,contact,accounting_period",
        account_contact_company: "account,contact,company",
        account_contact_company_accounting_period: "account,contact,company,accounting_period",
        accounting_period: "accounting_period",
        company: "company",
        company_accounting_period: "company,accounting_period",
        contact: "contact",
        contact_accounting_period: "contact,accounting_period",
        contact_company: "contact,company",
        contact_company_accounting_period: "contact,company,accounting_period",
        tracking_categories: "tracking_categories",
        tracking_categories_account: "tracking_categories,account",
        tracking_categories_account_accounting_period: "tracking_categories,account,accounting_period",
        tracking_categories_account_company: "tracking_categories,account,company",
        tracking_categories_account_company_accounting_period: "tracking_categories,account,company,accounting_period",
        tracking_categories_account_contact: "tracking_categories,account,contact",
        tracking_categories_account_contact_accounting_period: "tracking_categories,account,contact,accounting_period",
        tracking_categories_account_contact_company: "tracking_categories,account,contact,company",
        tracking_categories_account_contact_company_accounting_period: "tracking_categories,account,contact,company,accounting_period",
        tracking_categories_accounting_period: "tracking_categories,accounting_period",
        tracking_categories_company: "tracking_categories,company",
        tracking_categories_company_accounting_period: "tracking_categories,company,accounting_period",
        tracking_categories_contact: "tracking_categories,contact",
        tracking_categories_contact_accounting_period: "tracking_categories,contact,accounting_period",
        tracking_categories_contact_company: "tracking_categories,contact,company",
        tracking_categories_contact_company_accounting_period: "tracking_categories,contact,company,accounting_period"
      }.freeze
    end
  end
end
