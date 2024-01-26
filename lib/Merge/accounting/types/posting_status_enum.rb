# frozen_string_literal: true

module Merge
  module Accounting
    # @type [Hash{String => String}]
    POSTING_STATUS_ENUM = { unposted: "UNPOSTED", posted: "POSTED" }.frozen
  end
end
