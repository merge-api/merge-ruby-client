# frozen_string_literal: true

module Merge
  module Crm
    class Engagements
      # @type [ENGAGEMENTS_LIST_REQUEST_EXPAND]
      ENGAGEMENTS_LIST_REQUEST_EXPAND = {
        account: "account",
        account_engagement_type: "account,engagement_type",
        contacts: "contacts",
        contacts_account: "contacts,account",
        contacts_account_engagement_type: "contacts,account,engagement_type",
        contacts_engagement_type: "contacts,engagement_type",
        contacts_owner: "contacts,owner",
        contacts_owner_account: "contacts,owner,account",
        contacts_owner_account_engagement_type: "contacts,owner,account,engagement_type",
        contacts_owner_engagement_type: "contacts,owner,engagement_type",
        engagement_type: "engagement_type",
        owner: "owner",
        owner_account: "owner,account",
        owner_account_engagement_type: "owner,account,engagement_type",
        owner_engagement_type: "owner,engagement_type"
      }.freeze
    end
  end
end
