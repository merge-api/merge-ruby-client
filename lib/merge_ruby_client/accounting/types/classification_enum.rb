# frozen_string_literal: true

module Merge
  module Accounting
    # @type [CLASSIFICATION_ENUM]
    CLASSIFICATION_ENUM = {
      asset: "ASSET",
      equity: "EQUITY",
      expense: "EXPENSE",
      liability: "LIABILITY",
      revenue: "REVENUE"
    }.freeze
  end
end
