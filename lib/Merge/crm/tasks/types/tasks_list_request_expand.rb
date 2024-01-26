# frozen_string_literal: true

module Merge
  module Crm
    module Tasks
      # @type [Hash{String => String}]
      TASKS_LIST_REQUEST_EXPAND = {
        account: "account",
        account_opportunity: "account,opportunity",
        opportunity: "opportunity",
        owner: "owner",
        owner_account: "owner,account",
        owner_account_opportunity: "owner,account,opportunity",
        owner_opportunity: "owner,opportunity"
      }.frozen
    end
  end
end
