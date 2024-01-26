# frozen_string_literal: true

module Merge
  module Filestorage
    # @type [Hash{String => String}]
    SYNC_STATUS_STATUS_ENUM = {
      syncing: "SYNCING",
      done: "DONE",
      failed: "FAILED",
      disabled: "DISABLED",
      paused: "PAUSED",
      partially_synced: "PARTIALLY_SYNCED"
    }.frozen
  end
end
