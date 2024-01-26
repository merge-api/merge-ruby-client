# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [Hash{String => String}]
    ISSUE_STATUS_ENUM = { ongoing: "ONGOING", resolved: "RESOLVED" }.frozen
  end
end
