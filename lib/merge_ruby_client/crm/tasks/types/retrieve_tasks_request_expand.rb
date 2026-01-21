# frozen_string_literal: true

module Merge
  module Crm
    class Tasks
      class RetrieveTasksRequestExpand
        ACCOUNT = "account"
        ACCOUNT_CONTACT = "account,contact"
        ACCOUNT_OPPORTUNITY = "account,opportunity"
        ACCOUNT_OPPORTUNITY_CONTACT = "account,opportunity,contact"
        CONTACT = "contact"
        OPPORTUNITY = "opportunity"
        OPPORTUNITY_CONTACT = "opportunity,contact"
        OWNER = "owner"
        OWNER_ACCOUNT = "owner,account"
        OWNER_ACCOUNT_CONTACT = "owner,account,contact"
        OWNER_ACCOUNT_OPPORTUNITY = "owner,account,opportunity"
        OWNER_ACCOUNT_OPPORTUNITY_CONTACT = "owner,account,opportunity,contact"
        OWNER_CONTACT = "owner,contact"
        OWNER_OPPORTUNITY = "owner,opportunity"
        OWNER_OPPORTUNITY_CONTACT = "owner,opportunity,contact"
      end
    end
  end
end
