# frozen_string_literal: true

module Merge
  module Hris
    # @type [RUN_STATE_ENUM]
    RUN_STATE_ENUM = { paid: "PAID", draft: "DRAFT", approved: "APPROVED", failed: "FAILED", closed: "CLOSED" }.freeze
  end
end
