# frozen_string_literal: true

module Merge
  module Ticketing
    module Tickets
      # @type [Hash{String => String}]
      TICKETS_LIST_REQUEST_SHOW_ENUM_ORIGINS = {
        priority: "priority",
        priority_status: "priority,status",
        priority_status_ticket_type: "priority,status,ticket_type",
        priority_ticket_type: "priority,ticket_type",
        status: "status",
        status_ticket_type: "status,ticket_type",
        ticket_type: "ticket_type"
      }.frozen
    end
  end
end
