# frozen_string_literal: true

module Merge
  module Accounting
    class PurchaseOrders
      class PurchaseOrdersListRequestExpand
        ACCOUNTING_PERIOD = "accounting_period"
        ACCOUNTING_PERIOD_PAYMENT_TERM = "accounting_period,payment_term"
        COMPANY = "company"
        COMPANY_ACCOUNTING_PERIOD = "company,accounting_period"
        COMPANY_ACCOUNTING_PERIOD_PAYMENT_TERM = "company,accounting_period,payment_term"
        COMPANY_PAYMENT_TERM = "company,payment_term"
        DELIVERY_ADDRESS = "delivery_address"
        DELIVERY_ADDRESS_ACCOUNTING_PERIOD = "delivery_address,accounting_period"
        DELIVERY_ADDRESS_ACCOUNTING_PERIOD_PAYMENT_TERM = "delivery_address,accounting_period,payment_term"
        DELIVERY_ADDRESS_COMPANY = "delivery_address,company"
        DELIVERY_ADDRESS_COMPANY_ACCOUNTING_PERIOD = "delivery_address,company,accounting_period"
        DELIVERY_ADDRESS_COMPANY_ACCOUNTING_PERIOD_PAYMENT_TERM = "delivery_address,company,accounting_period,payment_term"
        DELIVERY_ADDRESS_COMPANY_PAYMENT_TERM = "delivery_address,company,payment_term"
        DELIVERY_ADDRESS_PAYMENT_TERM = "delivery_address,payment_term"
        DELIVERY_ADDRESS_VENDOR = "delivery_address,vendor"
        DELIVERY_ADDRESS_VENDOR_ACCOUNTING_PERIOD = "delivery_address,vendor,accounting_period"
        DELIVERY_ADDRESS_VENDOR_ACCOUNTING_PERIOD_PAYMENT_TERM = "delivery_address,vendor,accounting_period,payment_term"
        DELIVERY_ADDRESS_VENDOR_COMPANY = "delivery_address,vendor,company"
        DELIVERY_ADDRESS_VENDOR_COMPANY_ACCOUNTING_PERIOD = "delivery_address,vendor,company,accounting_period"
        DELIVERY_ADDRESS_VENDOR_COMPANY_ACCOUNTING_PERIOD_PAYMENT_TERM = "delivery_address,vendor,company,accounting_period,payment_term"
        DELIVERY_ADDRESS_VENDOR_COMPANY_PAYMENT_TERM = "delivery_address,vendor,company,payment_term"
        DELIVERY_ADDRESS_VENDOR_PAYMENT_TERM = "delivery_address,vendor,payment_term"
        LINE_ITEMS = "line_items"
        LINE_ITEMS_ACCOUNTING_PERIOD = "line_items,accounting_period"
        LINE_ITEMS_ACCOUNTING_PERIOD_PAYMENT_TERM = "line_items,accounting_period,payment_term"
        LINE_ITEMS_COMPANY = "line_items,company"
        LINE_ITEMS_COMPANY_ACCOUNTING_PERIOD = "line_items,company,accounting_period"
        LINE_ITEMS_COMPANY_ACCOUNTING_PERIOD_PAYMENT_TERM = "line_items,company,accounting_period,payment_term"
        LINE_ITEMS_COMPANY_PAYMENT_TERM = "line_items,company,payment_term"
        LINE_ITEMS_DELIVERY_ADDRESS = "line_items,delivery_address"
        LINE_ITEMS_DELIVERY_ADDRESS_ACCOUNTING_PERIOD = "line_items,delivery_address,accounting_period"
        LINE_ITEMS_DELIVERY_ADDRESS_ACCOUNTING_PERIOD_PAYMENT_TERM = "line_items,delivery_address,accounting_period,payment_term"
        LINE_ITEMS_DELIVERY_ADDRESS_COMPANY = "line_items,delivery_address,company"
        LINE_ITEMS_DELIVERY_ADDRESS_COMPANY_ACCOUNTING_PERIOD = "line_items,delivery_address,company,accounting_period"
        LINE_ITEMS_DELIVERY_ADDRESS_COMPANY_ACCOUNTING_PERIOD_PAYMENT_TERM = "line_items,delivery_address,company,accounting_period,payment_term"
        LINE_ITEMS_DELIVERY_ADDRESS_COMPANY_PAYMENT_TERM = "line_items,delivery_address,company,payment_term"
        LINE_ITEMS_DELIVERY_ADDRESS_PAYMENT_TERM = "line_items,delivery_address,payment_term"
        LINE_ITEMS_DELIVERY_ADDRESS_VENDOR = "line_items,delivery_address,vendor"
        LINE_ITEMS_DELIVERY_ADDRESS_VENDOR_ACCOUNTING_PERIOD = "line_items,delivery_address,vendor,accounting_period"
        LINE_ITEMS_DELIVERY_ADDRESS_VENDOR_ACCOUNTING_PERIOD_PAYMENT_TERM = "line_items,delivery_address,vendor,accounting_period,payment_term"
        LINE_ITEMS_DELIVERY_ADDRESS_VENDOR_COMPANY = "line_items,delivery_address,vendor,company"
        LINE_ITEMS_DELIVERY_ADDRESS_VENDOR_COMPANY_ACCOUNTING_PERIOD = "line_items,delivery_address,vendor,company,accounting_period"
        LINE_ITEMS_DELIVERY_ADDRESS_VENDOR_COMPANY_ACCOUNTING_PERIOD_PAYMENT_TERM = "line_items,delivery_address,vendor,company,accounting_period,payment_term"
        LINE_ITEMS_DELIVERY_ADDRESS_VENDOR_COMPANY_PAYMENT_TERM = "line_items,delivery_address,vendor,company,payment_term"
        LINE_ITEMS_DELIVERY_ADDRESS_VENDOR_PAYMENT_TERM = "line_items,delivery_address,vendor,payment_term"
        LINE_ITEMS_PAYMENT_TERM = "line_items,payment_term"
        LINE_ITEMS_TRACKING_CATEGORIES = "line_items,tracking_categories"
        LINE_ITEMS_TRACKING_CATEGORIES_ACCOUNTING_PERIOD = "line_items,tracking_categories,accounting_period"
        LINE_ITEMS_TRACKING_CATEGORIES_ACCOUNTING_PERIOD_PAYMENT_TERM = "line_items,tracking_categories,accounting_period,payment_term"
        LINE_ITEMS_TRACKING_CATEGORIES_COMPANY = "line_items,tracking_categories,company"
        LINE_ITEMS_TRACKING_CATEGORIES_COMPANY_ACCOUNTING_PERIOD = "line_items,tracking_categories,company,accounting_period"
        LINE_ITEMS_TRACKING_CATEGORIES_COMPANY_ACCOUNTING_PERIOD_PAYMENT_TERM = "line_items,tracking_categories,company,accounting_period,payment_term"
        LINE_ITEMS_TRACKING_CATEGORIES_COMPANY_PAYMENT_TERM = "line_items,tracking_categories,company,payment_term"
        LINE_ITEMS_TRACKING_CATEGORIES_DELIVERY_ADDRESS = "line_items,tracking_categories,delivery_address"
        LINE_ITEMS_TRACKING_CATEGORIES_DELIVERY_ADDRESS_ACCOUNTING_PERIOD = "line_items,tracking_categories,delivery_address,accounting_period"
        LINE_ITEMS_TRACKING_CATEGORIES_DELIVERY_ADDRESS_ACCOUNTING_PERIOD_PAYMENT_TERM = "line_items,tracking_categories,delivery_address,accounting_period,payment_term"
        LINE_ITEMS_TRACKING_CATEGORIES_DELIVERY_ADDRESS_COMPANY = "line_items,tracking_categories,delivery_address,company"
        LINE_ITEMS_TRACKING_CATEGORIES_DELIVERY_ADDRESS_COMPANY_ACCOUNTING_PERIOD = "line_items,tracking_categories,delivery_address,company,accounting_period"
        LINE_ITEMS_TRACKING_CATEGORIES_DELIVERY_ADDRESS_COMPANY_ACCOUNTING_PERIOD_PAYMENT_TERM = "line_items,tracking_categories,delivery_address,company,accounting_period,payment_term"
        LINE_ITEMS_TRACKING_CATEGORIES_DELIVERY_ADDRESS_COMPANY_PAYMENT_TERM = "line_items,tracking_categories,delivery_address,company,payment_term"
        LINE_ITEMS_TRACKING_CATEGORIES_DELIVERY_ADDRESS_PAYMENT_TERM = "line_items,tracking_categories,delivery_address,payment_term"
        LINE_ITEMS_TRACKING_CATEGORIES_DELIVERY_ADDRESS_VENDOR = "line_items,tracking_categories,delivery_address,vendor"
        LINE_ITEMS_TRACKING_CATEGORIES_DELIVERY_ADDRESS_VENDOR_ACCOUNTING_PERIOD = "line_items,tracking_categories,delivery_address,vendor,accounting_period"
        LINE_ITEMS_TRACKING_CATEGORIES_DELIVERY_ADDRESS_VENDOR_ACCOUNTING_PERIOD_PAYMENT_TERM = "line_items,tracking_categories,delivery_address,vendor,accounting_period,payment_term"
        LINE_ITEMS_TRACKING_CATEGORIES_DELIVERY_ADDRESS_VENDOR_COMPANY = "line_items,tracking_categories,delivery_address,vendor,company"
        LINE_ITEMS_TRACKING_CATEGORIES_DELIVERY_ADDRESS_VENDOR_COMPANY_ACCOUNTING_PERIOD = "line_items,tracking_categories,delivery_address,vendor,company,accounting_period"
        LINE_ITEMS_TRACKING_CATEGORIES_DELIVERY_ADDRESS_VENDOR_COMPANY_ACCOUNTING_PERIOD_PAYMENT_TERM = "line_items,tracking_categories,delivery_address,vendor,company,accounting_period,payment_term"
        LINE_ITEMS_TRACKING_CATEGORIES_DELIVERY_ADDRESS_VENDOR_COMPANY_PAYMENT_TERM = "line_items,tracking_categories,delivery_address,vendor,company,payment_term"
        LINE_ITEMS_TRACKING_CATEGORIES_DELIVERY_ADDRESS_VENDOR_PAYMENT_TERM = "line_items,tracking_categories,delivery_address,vendor,payment_term"
        LINE_ITEMS_TRACKING_CATEGORIES_PAYMENT_TERM = "line_items,tracking_categories,payment_term"
        LINE_ITEMS_TRACKING_CATEGORIES_VENDOR = "line_items,tracking_categories,vendor"
        LINE_ITEMS_TRACKING_CATEGORIES_VENDOR_ACCOUNTING_PERIOD = "line_items,tracking_categories,vendor,accounting_period"
        LINE_ITEMS_TRACKING_CATEGORIES_VENDOR_ACCOUNTING_PERIOD_PAYMENT_TERM = "line_items,tracking_categories,vendor,accounting_period,payment_term"
        LINE_ITEMS_TRACKING_CATEGORIES_VENDOR_COMPANY = "line_items,tracking_categories,vendor,company"
        LINE_ITEMS_TRACKING_CATEGORIES_VENDOR_COMPANY_ACCOUNTING_PERIOD = "line_items,tracking_categories,vendor,company,accounting_period"
        LINE_ITEMS_TRACKING_CATEGORIES_VENDOR_COMPANY_ACCOUNTING_PERIOD_PAYMENT_TERM = "line_items,tracking_categories,vendor,company,accounting_period,payment_term"
        LINE_ITEMS_TRACKING_CATEGORIES_VENDOR_COMPANY_PAYMENT_TERM = "line_items,tracking_categories,vendor,company,payment_term"
        LINE_ITEMS_TRACKING_CATEGORIES_VENDOR_PAYMENT_TERM = "line_items,tracking_categories,vendor,payment_term"
        LINE_ITEMS_VENDOR = "line_items,vendor"
        LINE_ITEMS_VENDOR_ACCOUNTING_PERIOD = "line_items,vendor,accounting_period"
        LINE_ITEMS_VENDOR_ACCOUNTING_PERIOD_PAYMENT_TERM = "line_items,vendor,accounting_period,payment_term"
        LINE_ITEMS_VENDOR_COMPANY = "line_items,vendor,company"
        LINE_ITEMS_VENDOR_COMPANY_ACCOUNTING_PERIOD = "line_items,vendor,company,accounting_period"
        LINE_ITEMS_VENDOR_COMPANY_ACCOUNTING_PERIOD_PAYMENT_TERM = "line_items,vendor,company,accounting_period,payment_term"
        LINE_ITEMS_VENDOR_COMPANY_PAYMENT_TERM = "line_items,vendor,company,payment_term"
        LINE_ITEMS_VENDOR_PAYMENT_TERM = "line_items,vendor,payment_term"
        PAYMENT_TERM = "payment_term"
        TRACKING_CATEGORIES = "tracking_categories"
        TRACKING_CATEGORIES_ACCOUNTING_PERIOD = "tracking_categories,accounting_period"
        TRACKING_CATEGORIES_ACCOUNTING_PERIOD_PAYMENT_TERM = "tracking_categories,accounting_period,payment_term"
        TRACKING_CATEGORIES_COMPANY = "tracking_categories,company"
        TRACKING_CATEGORIES_COMPANY_ACCOUNTING_PERIOD = "tracking_categories,company,accounting_period"
        TRACKING_CATEGORIES_COMPANY_ACCOUNTING_PERIOD_PAYMENT_TERM = "tracking_categories,company,accounting_period,payment_term"
        TRACKING_CATEGORIES_COMPANY_PAYMENT_TERM = "tracking_categories,company,payment_term"
        TRACKING_CATEGORIES_DELIVERY_ADDRESS = "tracking_categories,delivery_address"
        TRACKING_CATEGORIES_DELIVERY_ADDRESS_ACCOUNTING_PERIOD = "tracking_categories,delivery_address,accounting_period"
        TRACKING_CATEGORIES_DELIVERY_ADDRESS_ACCOUNTING_PERIOD_PAYMENT_TERM = "tracking_categories,delivery_address,accounting_period,payment_term"
        TRACKING_CATEGORIES_DELIVERY_ADDRESS_COMPANY = "tracking_categories,delivery_address,company"
        TRACKING_CATEGORIES_DELIVERY_ADDRESS_COMPANY_ACCOUNTING_PERIOD = "tracking_categories,delivery_address,company,accounting_period"
        TRACKING_CATEGORIES_DELIVERY_ADDRESS_COMPANY_ACCOUNTING_PERIOD_PAYMENT_TERM = "tracking_categories,delivery_address,company,accounting_period,payment_term"
        TRACKING_CATEGORIES_DELIVERY_ADDRESS_COMPANY_PAYMENT_TERM = "tracking_categories,delivery_address,company,payment_term"
        TRACKING_CATEGORIES_DELIVERY_ADDRESS_PAYMENT_TERM = "tracking_categories,delivery_address,payment_term"
        TRACKING_CATEGORIES_DELIVERY_ADDRESS_VENDOR = "tracking_categories,delivery_address,vendor"
        TRACKING_CATEGORIES_DELIVERY_ADDRESS_VENDOR_ACCOUNTING_PERIOD = "tracking_categories,delivery_address,vendor,accounting_period"
        TRACKING_CATEGORIES_DELIVERY_ADDRESS_VENDOR_ACCOUNTING_PERIOD_PAYMENT_TERM = "tracking_categories,delivery_address,vendor,accounting_period,payment_term"
        TRACKING_CATEGORIES_DELIVERY_ADDRESS_VENDOR_COMPANY = "tracking_categories,delivery_address,vendor,company"
        TRACKING_CATEGORIES_DELIVERY_ADDRESS_VENDOR_COMPANY_ACCOUNTING_PERIOD = "tracking_categories,delivery_address,vendor,company,accounting_period"
        TRACKING_CATEGORIES_DELIVERY_ADDRESS_VENDOR_COMPANY_ACCOUNTING_PERIOD_PAYMENT_TERM = "tracking_categories,delivery_address,vendor,company,accounting_period,payment_term"
        TRACKING_CATEGORIES_DELIVERY_ADDRESS_VENDOR_COMPANY_PAYMENT_TERM = "tracking_categories,delivery_address,vendor,company,payment_term"
        TRACKING_CATEGORIES_DELIVERY_ADDRESS_VENDOR_PAYMENT_TERM = "tracking_categories,delivery_address,vendor,payment_term"
        TRACKING_CATEGORIES_PAYMENT_TERM = "tracking_categories,payment_term"
        TRACKING_CATEGORIES_VENDOR = "tracking_categories,vendor"
        TRACKING_CATEGORIES_VENDOR_ACCOUNTING_PERIOD = "tracking_categories,vendor,accounting_period"
        TRACKING_CATEGORIES_VENDOR_ACCOUNTING_PERIOD_PAYMENT_TERM = "tracking_categories,vendor,accounting_period,payment_term"
        TRACKING_CATEGORIES_VENDOR_COMPANY = "tracking_categories,vendor,company"
        TRACKING_CATEGORIES_VENDOR_COMPANY_ACCOUNTING_PERIOD = "tracking_categories,vendor,company,accounting_period"
        TRACKING_CATEGORIES_VENDOR_COMPANY_ACCOUNTING_PERIOD_PAYMENT_TERM = "tracking_categories,vendor,company,accounting_period,payment_term"
        TRACKING_CATEGORIES_VENDOR_COMPANY_PAYMENT_TERM = "tracking_categories,vendor,company,payment_term"
        TRACKING_CATEGORIES_VENDOR_PAYMENT_TERM = "tracking_categories,vendor,payment_term"
        VENDOR = "vendor"
        VENDOR_ACCOUNTING_PERIOD = "vendor,accounting_period"
        VENDOR_ACCOUNTING_PERIOD_PAYMENT_TERM = "vendor,accounting_period,payment_term"
        VENDOR_COMPANY = "vendor,company"
        VENDOR_COMPANY_ACCOUNTING_PERIOD = "vendor,company,accounting_period"
        VENDOR_COMPANY_ACCOUNTING_PERIOD_PAYMENT_TERM = "vendor,company,accounting_period,payment_term"
        VENDOR_COMPANY_PAYMENT_TERM = "vendor,company,payment_term"
        VENDOR_PAYMENT_TERM = "vendor,payment_term"
      end
    end
  end
end
