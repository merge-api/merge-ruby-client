# frozen_string_literal: true

module Merge
  module Crm
    class Leads
      class LeadsListRequestExpand
        CONVERTED_ACCOUNT = "converted_account"
        CONVERTED_CONTACT = "converted_contact"
        CONVERTED_CONTACT_CONVERTED_ACCOUNT = "converted_contact,converted_account"
        OWNER = "owner"
        OWNER_CONVERTED_ACCOUNT = "owner,converted_account"
        OWNER_CONVERTED_CONTACT = "owner,converted_contact"
        OWNER_CONVERTED_CONTACT_CONVERTED_ACCOUNT = "owner,converted_contact,converted_account"
      end
    end
  end
end
