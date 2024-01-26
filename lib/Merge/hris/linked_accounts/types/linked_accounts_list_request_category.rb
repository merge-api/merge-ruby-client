# frozen_string_literal: true

module Merge
  module Hris
    module LinkedAccounts
      # @type [Hash{String => String}]
      LINKED_ACCOUNTS_LIST_REQUEST_CATEGORY = {
        accounting: "accounting",
        ats: "ats",
        crm: "crm",
        filestorage: "filestorage",
        hris: "hris",
        mktg: "mktg",
        ticketing: "ticketing"
      }.frozen
    end
  end
end
