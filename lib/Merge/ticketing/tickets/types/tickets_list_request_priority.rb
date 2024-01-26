# frozen_string_literal: true

module Merge
  module Ticketing
    module Tickets
      # @type [Hash{String => String}]
      TICKETS_LIST_REQUEST_PRIORITY = { high: "HIGH", low: "LOW", normal: "NORMAL", urgent: "URGENT" }.frozen
    end
  end
end
