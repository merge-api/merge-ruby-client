# frozen_string_literal: true

module Merge
  module Ticketing
    class Tickets
      # @type [TICKETS_LIST_REQUEST_STATUS]
      TICKETS_LIST_REQUEST_STATUS = {
        closed: "CLOSED",
        in_progress: "IN_PROGRESS",
        on_hold: "ON_HOLD",
        open: "OPEN"
      }.freeze
    end
  end
end
