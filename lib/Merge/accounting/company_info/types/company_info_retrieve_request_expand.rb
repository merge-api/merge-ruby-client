# frozen_string_literal: true

module Merge
  module Accounting
    module CompanyInfo
      # @type [Hash{String => String}]
      COMPANY_INFO_RETRIEVE_REQUEST_EXPAND = {
        addresses: "addresses",
        addresses_phone_numbers: "addresses,phone_numbers",
        phone_numbers: "phone_numbers"
      }.frozen
    end
  end
end
