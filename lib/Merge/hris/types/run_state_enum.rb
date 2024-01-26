# frozen_string_literal: true

module Merge
  module Hris
    # @type [Hash{String => String}]
    RUN_STATE_ENUM = { paid: "PAID", draft: "DRAFT", approved: "APPROVED", failed: "FAILED", closed: "CLOSED" }.frozen
  end
end
