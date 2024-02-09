# frozen_string_literal: true

module Merge
  module Crm
    class Opportunities
      # @type [OPPORTUNITIES_RETRIEVE_REQUEST_EXPAND]
      OPPORTUNITIES_RETRIEVE_REQUEST_EXPAND = {
        account: "account",
        owner: "owner",
        owner_account: "owner,account",
        owner_stage: "owner,stage",
        owner_stage_account: "owner,stage,account",
        stage: "stage",
        stage_account: "stage,account"
      }.freeze
    end
  end
end
