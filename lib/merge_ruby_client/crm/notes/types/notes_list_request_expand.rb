# frozen_string_literal: true

module Merge
  module Crm
    class Notes
      # @type [NOTES_LIST_REQUEST_EXPAND]
      NOTES_LIST_REQUEST_EXPAND = {
        account: "account",
        account_opportunity: "account,opportunity",
        contact: "contact",
        contact_account: "contact,account",
        contact_account_opportunity: "contact,account,opportunity",
        contact_opportunity: "contact,opportunity",
        opportunity: "opportunity",
        owner: "owner",
        owner_account: "owner,account",
        owner_account_opportunity: "owner,account,opportunity",
        owner_contact: "owner,contact",
        owner_contact_account: "owner,contact,account",
        owner_contact_account_opportunity: "owner,contact,account,opportunity",
        owner_contact_opportunity: "owner,contact,opportunity",
        owner_opportunity: "owner,opportunity"
      }.freeze
    end
  end
end
