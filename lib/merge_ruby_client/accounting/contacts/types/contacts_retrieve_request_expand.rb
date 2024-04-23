# frozen_string_literal: true

module Merge
  module Accounting
    class Contacts
      class ContactsRetrieveRequestExpand
        ADDRESSES = "addresses"
        ADDRESSES_COMPANY = "addresses,company"
        ADDRESSES_PHONE_NUMBERS = "addresses,phone_numbers"
        ADDRESSES_PHONE_NUMBERS_COMPANY = "addresses,phone_numbers,company"
        COMPANY = "company"
        PHONE_NUMBERS = "phone_numbers"
        PHONE_NUMBERS_COMPANY = "phone_numbers,company"
      end
    end
  end
end
