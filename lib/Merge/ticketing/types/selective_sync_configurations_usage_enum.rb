# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [Hash{String => String}]
    SELECTIVE_SYNC_CONFIGURATIONS_USAGE_ENUM = { in_next_sync: "IN_NEXT_SYNC", in_last_sync: "IN_LAST_SYNC" }.frozen
  end
end
