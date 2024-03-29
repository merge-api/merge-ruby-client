# frozen_string_literal: true

module Merge
  module Accounting
    class Payments
      # @type [PAYMENTS_LIST_REQUEST_EXPAND]
      PAYMENTS_LIST_REQUEST_EXPAND = {
        account: "account",
        account_accounting_period: "account,accounting_period",
        account_company: "account,company",
        account_company_accounting_period: "account,company,accounting_period",
        accounting_period: "accounting_period",
        applied_to_lines: "applied_to_lines",
        applied_to_lines_account: "applied_to_lines,account",
        applied_to_lines_account_accounting_period: "applied_to_lines,account,accounting_period",
        applied_to_lines_account_company: "applied_to_lines,account,company",
        applied_to_lines_account_company_accounting_period: "applied_to_lines,account,company,accounting_period",
        applied_to_lines_accounting_period: "applied_to_lines,accounting_period",
        applied_to_lines_company: "applied_to_lines,company",
        applied_to_lines_company_accounting_period: "applied_to_lines,company,accounting_period",
        applied_to_lines_contact: "applied_to_lines,contact",
        applied_to_lines_contact_account: "applied_to_lines,contact,account",
        applied_to_lines_contact_account_accounting_period: "applied_to_lines,contact,account,accounting_period",
        applied_to_lines_contact_account_company: "applied_to_lines,contact,account,company",
        applied_to_lines_contact_account_company_accounting_period: "applied_to_lines,contact,account,company,accounting_period",
        applied_to_lines_contact_accounting_period: "applied_to_lines,contact,accounting_period",
        applied_to_lines_contact_company: "applied_to_lines,contact,company",
        applied_to_lines_contact_company_accounting_period: "applied_to_lines,contact,company,accounting_period",
        company: "company",
        company_accounting_period: "company,accounting_period",
        contact: "contact",
        contact_account: "contact,account",
        contact_account_accounting_period: "contact,account,accounting_period",
        contact_account_company: "contact,account,company",
        contact_account_company_accounting_period: "contact,account,company,accounting_period",
        contact_accounting_period: "contact,accounting_period",
        contact_company: "contact,company",
        contact_company_accounting_period: "contact,company,accounting_period",
        tracking_categories: "tracking_categories",
        tracking_categories_account: "tracking_categories,account",
        tracking_categories_account_accounting_period: "tracking_categories,account,accounting_period",
        tracking_categories_account_company: "tracking_categories,account,company",
        tracking_categories_account_company_accounting_period: "tracking_categories,account,company,accounting_period",
        tracking_categories_accounting_period: "tracking_categories,accounting_period",
        tracking_categories_applied_to_lines: "tracking_categories,applied_to_lines",
        tracking_categories_applied_to_lines_account: "tracking_categories,applied_to_lines,account",
        tracking_categories_applied_to_lines_account_accounting_period: "tracking_categories,applied_to_lines,account,accounting_period",
        tracking_categories_applied_to_lines_account_company: "tracking_categories,applied_to_lines,account,company",
        tracking_categories_applied_to_lines_account_company_accounting_period: "tracking_categories,applied_to_lines,account,company,accounting_period",
        tracking_categories_applied_to_lines_accounting_period: "tracking_categories,applied_to_lines,accounting_period",
        tracking_categories_applied_to_lines_company: "tracking_categories,applied_to_lines,company",
        tracking_categories_applied_to_lines_company_accounting_period: "tracking_categories,applied_to_lines,company,accounting_period",
        tracking_categories_applied_to_lines_contact: "tracking_categories,applied_to_lines,contact",
        tracking_categories_applied_to_lines_contact_account: "tracking_categories,applied_to_lines,contact,account",
        tracking_categories_applied_to_lines_contact_account_accounting_period: "tracking_categories,applied_to_lines,contact,account,accounting_period",
        tracking_categories_applied_to_lines_contact_account_company: "tracking_categories,applied_to_lines,contact,account,company",
        tracking_categories_applied_to_lines_contact_account_company_accounting_period: "tracking_categories,applied_to_lines,contact,account,company,accounting_period",
        tracking_categories_applied_to_lines_contact_accounting_period: "tracking_categories,applied_to_lines,contact,accounting_period",
        tracking_categories_applied_to_lines_contact_company: "tracking_categories,applied_to_lines,contact,company",
        tracking_categories_applied_to_lines_contact_company_accounting_period: "tracking_categories,applied_to_lines,contact,company,accounting_period",
        tracking_categories_company: "tracking_categories,company",
        tracking_categories_company_accounting_period: "tracking_categories,company,accounting_period",
        tracking_categories_contact: "tracking_categories,contact",
        tracking_categories_contact_account: "tracking_categories,contact,account",
        tracking_categories_contact_account_accounting_period: "tracking_categories,contact,account,accounting_period",
        tracking_categories_contact_account_company: "tracking_categories,contact,account,company",
        tracking_categories_contact_account_company_accounting_period: "tracking_categories,contact,account,company,accounting_period",
        tracking_categories_contact_accounting_period: "tracking_categories,contact,accounting_period",
        tracking_categories_contact_company: "tracking_categories,contact,company",
        tracking_categories_contact_company_accounting_period: "tracking_categories,contact,company,accounting_period"
      }.freeze
    end
  end
end
