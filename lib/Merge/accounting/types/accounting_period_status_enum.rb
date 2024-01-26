# frozen_string_literal: true

module Merge
  module Accounting
    # @type [Hash{String => String}]
    ACCOUNTING_PERIOD_STATUS_ENUM = { active: "ACTIVE", inactive: "INACTIVE" }.frozen
  end
end
