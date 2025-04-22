# frozen_string_literal: true

module Merge
  module Filestorage
    # * `SYNCING` - SYNCING
    #  * `DONE` - DONE
    #  * `FAILED` - FAILED
    #  * `DISABLED` - DISABLED
    #  * `PAUSED` - PAUSED
    #  * `PARTIALLY_SYNCED` - PARTIALLY_SYNCED
    class StatusFd5Enum
      SYNCING = "SYNCING"
      DONE = "DONE"
      FAILED = "FAILED"
      DISABLED = "DISABLED"
      PAUSED = "PAUSED"
      PARTIALLY_SYNCED = "PARTIALLY_SYNCED"
    end
  end
end
