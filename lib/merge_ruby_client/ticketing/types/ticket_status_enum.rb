# frozen_string_literal: true

module Merge
  module Ticketing
    # * `OPEN` - OPEN
    #  * `CLOSED` - CLOSED
    #  * `IN_PROGRESS` - IN_PROGRESS
    #  * `ON_HOLD` - ON_HOLD
    class TicketStatusEnum
      OPEN = "OPEN"
      CLOSED = "CLOSED"
      IN_PROGRESS = "IN_PROGRESS"
      ON_HOLD = "ON_HOLD"
    end
  end
end
