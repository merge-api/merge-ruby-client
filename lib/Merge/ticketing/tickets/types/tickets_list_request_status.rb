# frozen_string_literal: true

module Merge
  module Ticketing
    module Tickets
      # @type [Hash{String => String}]
      TICKETS_LIST_REQUEST_STATUS = {
        closed: "CLOSED",
        in_progress: "IN_PROGRESS",
        on_hold: "ON_HOLD",
        open: "OPEN"
      }.frozen
    end
  end
end
