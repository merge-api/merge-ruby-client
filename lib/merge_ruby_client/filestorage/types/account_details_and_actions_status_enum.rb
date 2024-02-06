# frozen_string_literal: true

module Merge
  module Filestorage
    # @type [ACCOUNT_DETAILS_AND_ACTIONS_STATUS_ENUM]
    ACCOUNT_DETAILS_AND_ACTIONS_STATUS_ENUM = {
      complete: "COMPLETE",
      incomplete: "INCOMPLETE",
      relink_needed: "RELINK_NEEDED"
    }.freeze
  end
end
