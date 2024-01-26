# frozen_string_literal: true

module Merge
  module Accounting
    module Contacts
      # @type [Hash{String => String}]
      CONTACTS_RETRIEVE_REQUEST_EXPAND = {
        addresses: "addresses",
        addresses_company: "addresses,company",
        addresses_phone_numbers: "addresses,phone_numbers",
        addresses_phone_numbers_company: "addresses,phone_numbers,company",
        company: "company",
        phone_numbers: "phone_numbers",
        phone_numbers_company: "phone_numbers,company"
      }.frozen
    end
  end
end
