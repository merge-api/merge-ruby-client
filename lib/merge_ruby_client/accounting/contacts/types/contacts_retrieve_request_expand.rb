# frozen_string_literal: true

module Merge
  module Accounting
    class Contacts
      # @type [CONTACTS_RETRIEVE_REQUEST_EXPAND]
      CONTACTS_RETRIEVE_REQUEST_EXPAND = {
        addresses: "addresses",
        addresses_company: "addresses,company",
        addresses_phone_numbers: "addresses,phone_numbers",
        addresses_phone_numbers_company: "addresses,phone_numbers,company",
        company: "company",
        phone_numbers: "phone_numbers",
        phone_numbers_company: "phone_numbers,company"
      }.freeze
    end
  end
end
