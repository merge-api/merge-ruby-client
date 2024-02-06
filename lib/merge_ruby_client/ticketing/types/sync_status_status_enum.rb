# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [SYNC_STATUS_STATUS_ENUM]
    SYNC_STATUS_STATUS_ENUM = {
      syncing: "SYNCING",
      done: "DONE",
      failed: "FAILED",
      disabled: "DISABLED",
      paused: "PAUSED",
      partially_synced: "PARTIALLY_SYNCED"
    }.freeze
  end
end
