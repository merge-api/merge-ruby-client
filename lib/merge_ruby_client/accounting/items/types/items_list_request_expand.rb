# frozen_string_literal: true

module Merge
  module Accounting
    class Items
      class ItemsListRequestExpand
        COMPANY = "company"
        COMPANY_PURCHASE_TAX_RATE = "company,purchase_tax_rate"
        COMPANY_SALES_TAX_RATE = "company,sales_tax_rate"
        COMPANY_SALES_TAX_RATE_PURCHASE_TAX_RATE = "company,sales_tax_rate,purchase_tax_rate"
        PURCHASE_ACCOUNT = "purchase_account"
        PURCHASE_ACCOUNT_COMPANY = "purchase_account,company"
        PURCHASE_ACCOUNT_COMPANY_PURCHASE_TAX_RATE = "purchase_account,company,purchase_tax_rate"
        PURCHASE_ACCOUNT_COMPANY_SALES_TAX_RATE = "purchase_account,company,sales_tax_rate"
        PURCHASE_ACCOUNT_COMPANY_SALES_TAX_RATE_PURCHASE_TAX_RATE = "purchase_account,company,sales_tax_rate,purchase_tax_rate"
        PURCHASE_ACCOUNT_PURCHASE_TAX_RATE = "purchase_account,purchase_tax_rate"
        PURCHASE_ACCOUNT_SALES_ACCOUNT = "purchase_account,sales_account"
        PURCHASE_ACCOUNT_SALES_ACCOUNT_COMPANY = "purchase_account,sales_account,company"
        PURCHASE_ACCOUNT_SALES_ACCOUNT_COMPANY_PURCHASE_TAX_RATE = "purchase_account,sales_account,company,purchase_tax_rate"
        PURCHASE_ACCOUNT_SALES_ACCOUNT_COMPANY_SALES_TAX_RATE = "purchase_account,sales_account,company,sales_tax_rate"
        PURCHASE_ACCOUNT_SALES_ACCOUNT_COMPANY_SALES_TAX_RATE_PURCHASE_TAX_RATE = "purchase_account,sales_account,company,sales_tax_rate,purchase_tax_rate"
        PURCHASE_ACCOUNT_SALES_ACCOUNT_PURCHASE_TAX_RATE = "purchase_account,sales_account,purchase_tax_rate"
        PURCHASE_ACCOUNT_SALES_ACCOUNT_SALES_TAX_RATE = "purchase_account,sales_account,sales_tax_rate"
        PURCHASE_ACCOUNT_SALES_ACCOUNT_SALES_TAX_RATE_PURCHASE_TAX_RATE = "purchase_account,sales_account,sales_tax_rate,purchase_tax_rate"
        PURCHASE_ACCOUNT_SALES_TAX_RATE = "purchase_account,sales_tax_rate"
        PURCHASE_ACCOUNT_SALES_TAX_RATE_PURCHASE_TAX_RATE = "purchase_account,sales_tax_rate,purchase_tax_rate"
        PURCHASE_TAX_RATE = "purchase_tax_rate"
        SALES_ACCOUNT = "sales_account"
        SALES_ACCOUNT_COMPANY = "sales_account,company"
        SALES_ACCOUNT_COMPANY_PURCHASE_TAX_RATE = "sales_account,company,purchase_tax_rate"
        SALES_ACCOUNT_COMPANY_SALES_TAX_RATE = "sales_account,company,sales_tax_rate"
        SALES_ACCOUNT_COMPANY_SALES_TAX_RATE_PURCHASE_TAX_RATE = "sales_account,company,sales_tax_rate,purchase_tax_rate"
        SALES_ACCOUNT_PURCHASE_TAX_RATE = "sales_account,purchase_tax_rate"
        SALES_ACCOUNT_SALES_TAX_RATE = "sales_account,sales_tax_rate"
        SALES_ACCOUNT_SALES_TAX_RATE_PURCHASE_TAX_RATE = "sales_account,sales_tax_rate,purchase_tax_rate"
        SALES_TAX_RATE = "sales_tax_rate"
        SALES_TAX_RATE_PURCHASE_TAX_RATE = "sales_tax_rate,purchase_tax_rate"
      end
    end
  end
end
