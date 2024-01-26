# frozen_string_literal: true

module Merge
  module Accounting
    # @type [Hash{String => String}]
    CLASSIFICATION_ENUM = {
      asset: "ASSET",
      equity: "EQUITY",
      expense: "EXPENSE",
      liability: "LIABILITY",
      revenue: "REVENUE"
    }.frozen
  end
end
