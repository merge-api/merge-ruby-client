# frozen_string_literal: true

module Merge
  module Crm
    module Opportunities
      # @type [Hash{String => String}]
      OPPORTUNITIES_LIST_REQUEST_EXPAND = {
        account: "account",
        owner: "owner",
        owner_account: "owner,account",
        owner_stage: "owner,stage",
        owner_stage_account: "owner,stage,account",
        stage: "stage",
        stage_account: "stage,account"
      }.frozen
    end
  end
end
