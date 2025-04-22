# frozen_string_literal: true

module Merge
  module Hris
    # * `SYNCING` - SYNCING
    #  * `DONE` - DONE
    #  * `FAILED` - FAILED
    #  * `DISABLED` - DISABLED
    #  * `PAUSED` - PAUSED
    #  * `PARTIALLY_SYNCED` - PARTIALLY_SYNCED
    class LastSyncResultEnum
      SYNCING = "SYNCING"
      DONE = "DONE"
      FAILED = "FAILED"
      DISABLED = "DISABLED"
      PAUSED = "PAUSED"
      PARTIALLY_SYNCED = "PARTIALLY_SYNCED"
    end
  end
end
