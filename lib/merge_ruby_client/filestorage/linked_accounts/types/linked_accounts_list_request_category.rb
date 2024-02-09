# frozen_string_literal: true

module Merge
  module Filestorage
    class LinkedAccounts
      # @type [LINKED_ACCOUNTS_LIST_REQUEST_CATEGORY]
      LINKED_ACCOUNTS_LIST_REQUEST_CATEGORY = {
        accounting: "accounting",
        ats: "ats",
        crm: "crm",
        filestorage: "filestorage",
        hris: "hris",
        mktg: "mktg",
        ticketing: "ticketing"
      }.freeze
    end
  end
end
