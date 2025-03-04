# frozen_string_literal: true

module Merge
  module Accounting
    # - `SYNCING` - SYNCING
    #  - `DONE` - DONE
    #  - `FAILED` - FAILED
    #  - `DISABLED` - DISABLED
    #  - `PAUSED` - PAUSED
    #  - `PARTIALLY_SYNCED` - PARTIALLY_SYNCED
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
