# frozen_string_literal: true

module Merge
  module Crm
    class Tasks
      # @type [TASKS_RETRIEVE_REQUEST_EXPAND]
      TASKS_RETRIEVE_REQUEST_EXPAND = {
        account: "account",
        account_opportunity: "account,opportunity",
        opportunity: "opportunity",
        owner: "owner",
        owner_account: "owner,account",
        owner_account_opportunity: "owner,account,opportunity",
        owner_opportunity: "owner,opportunity"
      }.freeze
    end
  end
end
