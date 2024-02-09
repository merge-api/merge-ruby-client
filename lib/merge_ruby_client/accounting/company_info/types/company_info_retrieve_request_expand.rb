# frozen_string_literal: true

module Merge
  module Accounting
    class CompanyInfo
      # @type [COMPANY_INFO_RETRIEVE_REQUEST_EXPAND]
      COMPANY_INFO_RETRIEVE_REQUEST_EXPAND = {
        addresses: "addresses",
        addresses_phone_numbers: "addresses,phone_numbers",
        phone_numbers: "phone_numbers"
      }.freeze
    end
  end
end
