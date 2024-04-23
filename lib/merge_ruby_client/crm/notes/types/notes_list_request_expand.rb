# frozen_string_literal: true

module Merge
  module Crm
    class Notes
      class NotesListRequestExpand
        ACCOUNT = "account"
        ACCOUNT_OPPORTUNITY = "account,opportunity"
        CONTACT = "contact"
        CONTACT_ACCOUNT = "contact,account"
        CONTACT_ACCOUNT_OPPORTUNITY = "contact,account,opportunity"
        CONTACT_OPPORTUNITY = "contact,opportunity"
        OPPORTUNITY = "opportunity"
        OWNER = "owner"
        OWNER_ACCOUNT = "owner,account"
        OWNER_ACCOUNT_OPPORTUNITY = "owner,account,opportunity"
        OWNER_CONTACT = "owner,contact"
        OWNER_CONTACT_ACCOUNT = "owner,contact,account"
        OWNER_CONTACT_ACCOUNT_OPPORTUNITY = "owner,contact,account,opportunity"
        OWNER_CONTACT_OPPORTUNITY = "owner,contact,opportunity"
        OWNER_OPPORTUNITY = "owner,opportunity"
      end
    end
  end
end
