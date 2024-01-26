# frozen_string_literal: true

module Merge
  module Crm
    module Contacts
      # @type [Hash{String => String}]
      CONTACTS_RETRIEVE_REQUEST_EXPAND = { account: "account", account_owner: "account,owner", owner: "owner" }.frozen
    end
  end
end
