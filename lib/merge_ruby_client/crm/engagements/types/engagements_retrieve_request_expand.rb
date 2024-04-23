# frozen_string_literal: true

module Merge
  module Crm
    class Engagements
      class EngagementsRetrieveRequestExpand
        ACCOUNT = "account"
        ACCOUNT_ENGAGEMENT_TYPE = "account,engagement_type"
        CONTACTS = "contacts"
        CONTACTS_ACCOUNT = "contacts,account"
        CONTACTS_ACCOUNT_ENGAGEMENT_TYPE = "contacts,account,engagement_type"
        CONTACTS_ENGAGEMENT_TYPE = "contacts,engagement_type"
        CONTACTS_OWNER = "contacts,owner"
        CONTACTS_OWNER_ACCOUNT = "contacts,owner,account"
        CONTACTS_OWNER_ACCOUNT_ENGAGEMENT_TYPE = "contacts,owner,account,engagement_type"
        CONTACTS_OWNER_ENGAGEMENT_TYPE = "contacts,owner,engagement_type"
        ENGAGEMENT_TYPE = "engagement_type"
        OWNER = "owner"
        OWNER_ACCOUNT = "owner,account"
        OWNER_ACCOUNT_ENGAGEMENT_TYPE = "owner,account,engagement_type"
        OWNER_ENGAGEMENT_TYPE = "owner,engagement_type"
      end
    end
  end
end
