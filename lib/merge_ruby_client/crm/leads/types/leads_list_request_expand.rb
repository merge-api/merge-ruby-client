# frozen_string_literal: true

module Merge
  module Crm
    class Leads
      # @type [LEADS_LIST_REQUEST_EXPAND]
      LEADS_LIST_REQUEST_EXPAND = {
        converted_account: "converted_account",
        converted_contact: "converted_contact",
        converted_contact_converted_account: "converted_contact,converted_account",
        owner: "owner",
        owner_converted_account: "owner,converted_account",
        owner_converted_contact: "owner,converted_contact",
        owner_converted_contact_converted_account: "owner,converted_contact,converted_account"
      }.freeze
    end
  end
end
