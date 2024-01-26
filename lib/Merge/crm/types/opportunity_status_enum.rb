# frozen_string_literal: true

module Merge
  module Crm
    # @type [Hash{String => String}]
    OPPORTUNITY_STATUS_ENUM = { open: "OPEN", won: "WON", lost: "LOST" }.frozen
  end
end
