# frozen_string_literal: true

module Merge
  module Accounting
    class Items
      class ItemsRetrieveRequestExpand
        COMPANY = "company"
        PURCHASE_ACCOUNT = "purchase_account"
        PURCHASE_ACCOUNT_COMPANY = "purchase_account,company"
        PURCHASE_ACCOUNT_SALES_ACCOUNT = "purchase_account,sales_account"
        PURCHASE_ACCOUNT_SALES_ACCOUNT_COMPANY = "purchase_account,sales_account,company"
        SALES_ACCOUNT = "sales_account"
        SALES_ACCOUNT_COMPANY = "sales_account,company"
      end
    end
  end
end
