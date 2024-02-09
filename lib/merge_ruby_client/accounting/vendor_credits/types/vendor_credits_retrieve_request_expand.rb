# frozen_string_literal: true

module Merge
  module Accounting
    class VendorCredits
      # @type [VENDOR_CREDITS_RETRIEVE_REQUEST_EXPAND]
      VENDOR_CREDITS_RETRIEVE_REQUEST_EXPAND = {
        accounting_period: "accounting_period",
        company: "company",
        company_accounting_period: "company,accounting_period",
        lines: "lines",
        lines_accounting_period: "lines,accounting_period",
        lines_company: "lines,company",
        lines_company_accounting_period: "lines,company,accounting_period",
        lines_tracking_categories: "lines,tracking_categories",
        lines_tracking_categories_accounting_period: "lines,tracking_categories,accounting_period",
        lines_tracking_categories_company: "lines,tracking_categories,company",
        lines_tracking_categories_company_accounting_period: "lines,tracking_categories,company,accounting_period",
        lines_tracking_categories_vendor: "lines,tracking_categories,vendor",
        lines_tracking_categories_vendor_accounting_period: "lines,tracking_categories,vendor,accounting_period",
        lines_tracking_categories_vendor_company: "lines,tracking_categories,vendor,company",
        lines_tracking_categories_vendor_company_accounting_period: "lines,tracking_categories,vendor,company,accounting_period",
        lines_vendor: "lines,vendor",
        lines_vendor_accounting_period: "lines,vendor,accounting_period",
        lines_vendor_company: "lines,vendor,company",
        lines_vendor_company_accounting_period: "lines,vendor,company,accounting_period",
        tracking_categories: "tracking_categories",
        tracking_categories_accounting_period: "tracking_categories,accounting_period",
        tracking_categories_company: "tracking_categories,company",
        tracking_categories_company_accounting_period: "tracking_categories,company,accounting_period",
        tracking_categories_vendor: "tracking_categories,vendor",
        tracking_categories_vendor_accounting_period: "tracking_categories,vendor,accounting_period",
        tracking_categories_vendor_company: "tracking_categories,vendor,company",
        tracking_categories_vendor_company_accounting_period: "tracking_categories,vendor,company,accounting_period",
        vendor: "vendor",
        vendor_accounting_period: "vendor,accounting_period",
        vendor_company: "vendor,company",
        vendor_company_accounting_period: "vendor,company,accounting_period"
      }.freeze
    end
  end
end
