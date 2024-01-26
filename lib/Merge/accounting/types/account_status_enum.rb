# frozen_string_literal: true

module Merge
  module Accounting
    # @type [Hash{String => String}]
    ACCOUNT_STATUS_ENUM = { active: "ACTIVE", pending: "PENDING", inactive: "INACTIVE" }.frozen
  end
end
