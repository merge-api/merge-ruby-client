# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [Hash{String => String}]
    PRIORITY_ENUM = { urgent: "URGENT", high: "HIGH", normal: "NORMAL", low: "LOW" }.frozen
  end
end
