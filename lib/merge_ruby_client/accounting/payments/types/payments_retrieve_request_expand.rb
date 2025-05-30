# frozen_string_literal: true

module Merge
  module Accounting
    class Payments
      class PaymentsRetrieveRequestExpand
        ACCOUNT = "account"
        ACCOUNT_ACCOUNTING_PERIOD = "account,accounting_period"
        ACCOUNT_ACCOUNTING_PERIOD_PAYMENT_METHOD = "account,accounting_period,payment_method"
        ACCOUNT_COMPANY = "account,company"
        ACCOUNT_COMPANY_ACCOUNTING_PERIOD = "account,company,accounting_period"
        ACCOUNT_COMPANY_ACCOUNTING_PERIOD_PAYMENT_METHOD = "account,company,accounting_period,payment_method"
        ACCOUNT_COMPANY_PAYMENT_METHOD = "account,company,payment_method"
        ACCOUNT_PAYMENT_METHOD = "account,payment_method"
        ACCOUNTING_PERIOD = "accounting_period"
        ACCOUNTING_PERIOD_PAYMENT_METHOD = "accounting_period,payment_method"
        APPLIED_TO_LINES = "applied_to_lines"
        APPLIED_TO_LINES_ACCOUNT = "applied_to_lines,account"
        APPLIED_TO_LINES_ACCOUNT_ACCOUNTING_PERIOD = "applied_to_lines,account,accounting_period"
        APPLIED_TO_LINES_ACCOUNT_ACCOUNTING_PERIOD_PAYMENT_METHOD = "applied_to_lines,account,accounting_period,payment_method"
        APPLIED_TO_LINES_ACCOUNT_COMPANY = "applied_to_lines,account,company"
        APPLIED_TO_LINES_ACCOUNT_COMPANY_ACCOUNTING_PERIOD = "applied_to_lines,account,company,accounting_period"
        APPLIED_TO_LINES_ACCOUNT_COMPANY_ACCOUNTING_PERIOD_PAYMENT_METHOD = "applied_to_lines,account,company,accounting_period,payment_method"
        APPLIED_TO_LINES_ACCOUNT_COMPANY_PAYMENT_METHOD = "applied_to_lines,account,company,payment_method"
        APPLIED_TO_LINES_ACCOUNT_PAYMENT_METHOD = "applied_to_lines,account,payment_method"
        APPLIED_TO_LINES_ACCOUNTING_PERIOD = "applied_to_lines,accounting_period"
        APPLIED_TO_LINES_ACCOUNTING_PERIOD_PAYMENT_METHOD = "applied_to_lines,accounting_period,payment_method"
        APPLIED_TO_LINES_COMPANY = "applied_to_lines,company"
        APPLIED_TO_LINES_COMPANY_ACCOUNTING_PERIOD = "applied_to_lines,company,accounting_period"
        APPLIED_TO_LINES_COMPANY_ACCOUNTING_PERIOD_PAYMENT_METHOD = "applied_to_lines,company,accounting_period,payment_method"
        APPLIED_TO_LINES_COMPANY_PAYMENT_METHOD = "applied_to_lines,company,payment_method"
        APPLIED_TO_LINES_CONTACT = "applied_to_lines,contact"
        APPLIED_TO_LINES_CONTACT_ACCOUNT = "applied_to_lines,contact,account"
        APPLIED_TO_LINES_CONTACT_ACCOUNT_ACCOUNTING_PERIOD = "applied_to_lines,contact,account,accounting_period"
        APPLIED_TO_LINES_CONTACT_ACCOUNT_ACCOUNTING_PERIOD_PAYMENT_METHOD = "applied_to_lines,contact,account,accounting_period,payment_method"
        APPLIED_TO_LINES_CONTACT_ACCOUNT_COMPANY = "applied_to_lines,contact,account,company"
        APPLIED_TO_LINES_CONTACT_ACCOUNT_COMPANY_ACCOUNTING_PERIOD = "applied_to_lines,contact,account,company,accounting_period"
        APPLIED_TO_LINES_CONTACT_ACCOUNT_COMPANY_ACCOUNTING_PERIOD_PAYMENT_METHOD = "applied_to_lines,contact,account,company,accounting_period,payment_method"
        APPLIED_TO_LINES_CONTACT_ACCOUNT_COMPANY_PAYMENT_METHOD = "applied_to_lines,contact,account,company,payment_method"
        APPLIED_TO_LINES_CONTACT_ACCOUNT_PAYMENT_METHOD = "applied_to_lines,contact,account,payment_method"
        APPLIED_TO_LINES_CONTACT_ACCOUNTING_PERIOD = "applied_to_lines,contact,accounting_period"
        APPLIED_TO_LINES_CONTACT_ACCOUNTING_PERIOD_PAYMENT_METHOD = "applied_to_lines,contact,accounting_period,payment_method"
        APPLIED_TO_LINES_CONTACT_COMPANY = "applied_to_lines,contact,company"
        APPLIED_TO_LINES_CONTACT_COMPANY_ACCOUNTING_PERIOD = "applied_to_lines,contact,company,accounting_period"
        APPLIED_TO_LINES_CONTACT_COMPANY_ACCOUNTING_PERIOD_PAYMENT_METHOD = "applied_to_lines,contact,company,accounting_period,payment_method"
        APPLIED_TO_LINES_CONTACT_COMPANY_PAYMENT_METHOD = "applied_to_lines,contact,company,payment_method"
        APPLIED_TO_LINES_CONTACT_PAYMENT_METHOD = "applied_to_lines,contact,payment_method"
        APPLIED_TO_LINES_PAYMENT_METHOD = "applied_to_lines,payment_method"
        COMPANY = "company"
        COMPANY_ACCOUNTING_PERIOD = "company,accounting_period"
        COMPANY_ACCOUNTING_PERIOD_PAYMENT_METHOD = "company,accounting_period,payment_method"
        COMPANY_PAYMENT_METHOD = "company,payment_method"
        CONTACT = "contact"
        CONTACT_ACCOUNT = "contact,account"
        CONTACT_ACCOUNT_ACCOUNTING_PERIOD = "contact,account,accounting_period"
        CONTACT_ACCOUNT_ACCOUNTING_PERIOD_PAYMENT_METHOD = "contact,account,accounting_period,payment_method"
        CONTACT_ACCOUNT_COMPANY = "contact,account,company"
        CONTACT_ACCOUNT_COMPANY_ACCOUNTING_PERIOD = "contact,account,company,accounting_period"
        CONTACT_ACCOUNT_COMPANY_ACCOUNTING_PERIOD_PAYMENT_METHOD = "contact,account,company,accounting_period,payment_method"
        CONTACT_ACCOUNT_COMPANY_PAYMENT_METHOD = "contact,account,company,payment_method"
        CONTACT_ACCOUNT_PAYMENT_METHOD = "contact,account,payment_method"
        CONTACT_ACCOUNTING_PERIOD = "contact,accounting_period"
        CONTACT_ACCOUNTING_PERIOD_PAYMENT_METHOD = "contact,accounting_period,payment_method"
        CONTACT_COMPANY = "contact,company"
        CONTACT_COMPANY_ACCOUNTING_PERIOD = "contact,company,accounting_period"
        CONTACT_COMPANY_ACCOUNTING_PERIOD_PAYMENT_METHOD = "contact,company,accounting_period,payment_method"
        CONTACT_COMPANY_PAYMENT_METHOD = "contact,company,payment_method"
        CONTACT_PAYMENT_METHOD = "contact,payment_method"
        PAYMENT_METHOD = "payment_method"
        TRACKING_CATEGORIES = "tracking_categories"
        TRACKING_CATEGORIES_ACCOUNT = "tracking_categories,account"
        TRACKING_CATEGORIES_ACCOUNT_ACCOUNTING_PERIOD = "tracking_categories,account,accounting_period"
        TRACKING_CATEGORIES_ACCOUNT_ACCOUNTING_PERIOD_PAYMENT_METHOD = "tracking_categories,account,accounting_period,payment_method"
        TRACKING_CATEGORIES_ACCOUNT_COMPANY = "tracking_categories,account,company"
        TRACKING_CATEGORIES_ACCOUNT_COMPANY_ACCOUNTING_PERIOD = "tracking_categories,account,company,accounting_period"
        TRACKING_CATEGORIES_ACCOUNT_COMPANY_ACCOUNTING_PERIOD_PAYMENT_METHOD = "tracking_categories,account,company,accounting_period,payment_method"
        TRACKING_CATEGORIES_ACCOUNT_COMPANY_PAYMENT_METHOD = "tracking_categories,account,company,payment_method"
        TRACKING_CATEGORIES_ACCOUNT_PAYMENT_METHOD = "tracking_categories,account,payment_method"
        TRACKING_CATEGORIES_ACCOUNTING_PERIOD = "tracking_categories,accounting_period"
        TRACKING_CATEGORIES_ACCOUNTING_PERIOD_PAYMENT_METHOD = "tracking_categories,accounting_period,payment_method"
        TRACKING_CATEGORIES_APPLIED_TO_LINES = "tracking_categories,applied_to_lines"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_ACCOUNT = "tracking_categories,applied_to_lines,account"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_ACCOUNT_ACCOUNTING_PERIOD = "tracking_categories,applied_to_lines,account,accounting_period"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_ACCOUNT_ACCOUNTING_PERIOD_PAYMENT_METHOD = "tracking_categories,applied_to_lines,account,accounting_period,payment_method"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_ACCOUNT_COMPANY = "tracking_categories,applied_to_lines,account,company"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_ACCOUNT_COMPANY_ACCOUNTING_PERIOD = "tracking_categories,applied_to_lines,account,company,accounting_period"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_ACCOUNT_COMPANY_ACCOUNTING_PERIOD_PAYMENT_METHOD = "tracking_categories,applied_to_lines,account,company,accounting_period,payment_method"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_ACCOUNT_COMPANY_PAYMENT_METHOD = "tracking_categories,applied_to_lines,account,company,payment_method"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_ACCOUNT_PAYMENT_METHOD = "tracking_categories,applied_to_lines,account,payment_method"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_ACCOUNTING_PERIOD = "tracking_categories,applied_to_lines,accounting_period"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_ACCOUNTING_PERIOD_PAYMENT_METHOD = "tracking_categories,applied_to_lines,accounting_period,payment_method"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_COMPANY = "tracking_categories,applied_to_lines,company"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_COMPANY_ACCOUNTING_PERIOD = "tracking_categories,applied_to_lines,company,accounting_period"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_COMPANY_ACCOUNTING_PERIOD_PAYMENT_METHOD = "tracking_categories,applied_to_lines,company,accounting_period,payment_method"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_COMPANY_PAYMENT_METHOD = "tracking_categories,applied_to_lines,company,payment_method"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_CONTACT = "tracking_categories,applied_to_lines,contact"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_CONTACT_ACCOUNT = "tracking_categories,applied_to_lines,contact,account"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_CONTACT_ACCOUNT_ACCOUNTING_PERIOD = "tracking_categories,applied_to_lines,contact,account,accounting_period"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_CONTACT_ACCOUNT_ACCOUNTING_PERIOD_PAYMENT_METHOD = "tracking_categories,applied_to_lines,contact,account,accounting_period,payment_method"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_CONTACT_ACCOUNT_COMPANY = "tracking_categories,applied_to_lines,contact,account,company"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_CONTACT_ACCOUNT_COMPANY_ACCOUNTING_PERIOD = "tracking_categories,applied_to_lines,contact,account,company,accounting_period"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_CONTACT_ACCOUNT_COMPANY_ACCOUNTING_PERIOD_PAYMENT_METHOD = "tracking_categories,applied_to_lines,contact,account,company,accounting_period,payment_method"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_CONTACT_ACCOUNT_COMPANY_PAYMENT_METHOD = "tracking_categories,applied_to_lines,contact,account,company,payment_method"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_CONTACT_ACCOUNT_PAYMENT_METHOD = "tracking_categories,applied_to_lines,contact,account,payment_method"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_CONTACT_ACCOUNTING_PERIOD = "tracking_categories,applied_to_lines,contact,accounting_period"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_CONTACT_ACCOUNTING_PERIOD_PAYMENT_METHOD = "tracking_categories,applied_to_lines,contact,accounting_period,payment_method"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_CONTACT_COMPANY = "tracking_categories,applied_to_lines,contact,company"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_CONTACT_COMPANY_ACCOUNTING_PERIOD = "tracking_categories,applied_to_lines,contact,company,accounting_period"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_CONTACT_COMPANY_ACCOUNTING_PERIOD_PAYMENT_METHOD = "tracking_categories,applied_to_lines,contact,company,accounting_period,payment_method"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_CONTACT_COMPANY_PAYMENT_METHOD = "tracking_categories,applied_to_lines,contact,company,payment_method"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_CONTACT_PAYMENT_METHOD = "tracking_categories,applied_to_lines,contact,payment_method"
        TRACKING_CATEGORIES_APPLIED_TO_LINES_PAYMENT_METHOD = "tracking_categories,applied_to_lines,payment_method"
        TRACKING_CATEGORIES_COMPANY = "tracking_categories,company"
        TRACKING_CATEGORIES_COMPANY_ACCOUNTING_PERIOD = "tracking_categories,company,accounting_period"
        TRACKING_CATEGORIES_COMPANY_ACCOUNTING_PERIOD_PAYMENT_METHOD = "tracking_categories,company,accounting_period,payment_method"
        TRACKING_CATEGORIES_COMPANY_PAYMENT_METHOD = "tracking_categories,company,payment_method"
        TRACKING_CATEGORIES_CONTACT = "tracking_categories,contact"
        TRACKING_CATEGORIES_CONTACT_ACCOUNT = "tracking_categories,contact,account"
        TRACKING_CATEGORIES_CONTACT_ACCOUNT_ACCOUNTING_PERIOD = "tracking_categories,contact,account,accounting_period"
        TRACKING_CATEGORIES_CONTACT_ACCOUNT_ACCOUNTING_PERIOD_PAYMENT_METHOD = "tracking_categories,contact,account,accounting_period,payment_method"
        TRACKING_CATEGORIES_CONTACT_ACCOUNT_COMPANY = "tracking_categories,contact,account,company"
        TRACKING_CATEGORIES_CONTACT_ACCOUNT_COMPANY_ACCOUNTING_PERIOD = "tracking_categories,contact,account,company,accounting_period"
        TRACKING_CATEGORIES_CONTACT_ACCOUNT_COMPANY_ACCOUNTING_PERIOD_PAYMENT_METHOD = "tracking_categories,contact,account,company,accounting_period,payment_method"
        TRACKING_CATEGORIES_CONTACT_ACCOUNT_COMPANY_PAYMENT_METHOD = "tracking_categories,contact,account,company,payment_method"
        TRACKING_CATEGORIES_CONTACT_ACCOUNT_PAYMENT_METHOD = "tracking_categories,contact,account,payment_method"
        TRACKING_CATEGORIES_CONTACT_ACCOUNTING_PERIOD = "tracking_categories,contact,accounting_period"
        TRACKING_CATEGORIES_CONTACT_ACCOUNTING_PERIOD_PAYMENT_METHOD = "tracking_categories,contact,accounting_period,payment_method"
        TRACKING_CATEGORIES_CONTACT_COMPANY = "tracking_categories,contact,company"
        TRACKING_CATEGORIES_CONTACT_COMPANY_ACCOUNTING_PERIOD = "tracking_categories,contact,company,accounting_period"
        TRACKING_CATEGORIES_CONTACT_COMPANY_ACCOUNTING_PERIOD_PAYMENT_METHOD = "tracking_categories,contact,company,accounting_period,payment_method"
        TRACKING_CATEGORIES_CONTACT_COMPANY_PAYMENT_METHOD = "tracking_categories,contact,company,payment_method"
        TRACKING_CATEGORIES_CONTACT_PAYMENT_METHOD = "tracking_categories,contact,payment_method"
        TRACKING_CATEGORIES_PAYMENT_METHOD = "tracking_categories,payment_method"
      end
    end
  end
end
