# frozen_string_literal: true

module Merge
  module Hris
    # @type [Hash{String => String}]
    ACCOUNT_DETAILS_AND_ACTIONS_STATUS_ENUM = {
      complete: "COMPLETE",
      incomplete: "INCOMPLETE",
      relink_needed: "RELINK_NEEDED"
    }.frozen
  end
end
