# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [Hash{String => String}]
    TICKET_STATUS_ENUM = { open: "OPEN", closed: "CLOSED", in_progress: "IN_PROGRESS", on_hold: "ON_HOLD" }.frozen
  end
end
