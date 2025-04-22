# frozen_string_literal: true

module Merge
  module Accounting
    # * `QUEUED` - QUEUED
    #  * `IN_PROGRESS` - IN_PROGRESS
    #  * `COMPLETED` - COMPLETED
    #  * `FAILURE` - FAILURE
    class AsyncPostTaskStatusEnum
      QUEUED = "QUEUED"
      IN_PROGRESS = "IN_PROGRESS"
      COMPLETED = "COMPLETED"
      FAILURE = "FAILURE"
    end
  end
end
