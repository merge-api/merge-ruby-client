# frozen_string_literal: true

module Merge
  module Crm
    class Contacts
      # @type [CONTACTS_RETRIEVE_REQUEST_EXPAND]
      CONTACTS_RETRIEVE_REQUEST_EXPAND = { account: "account", account_owner: "account,owner", owner: "owner" }.freeze
    end
  end
end
