# frozen_string_literal: true

module Merge
  module Accounting
    class Items
      # @type [ITEMS_RETRIEVE_REQUEST_EXPAND]
      ITEMS_RETRIEVE_REQUEST_EXPAND = {
        company: "company",
        purchase_account: "purchase_account",
        purchase_account_company: "purchase_account,company",
        purchase_account_sales_account: "purchase_account,sales_account",
        purchase_account_sales_account_company: "purchase_account,sales_account,company",
        sales_account: "sales_account",
        sales_account_company: "sales_account,company"
      }.freeze
    end
  end
end
