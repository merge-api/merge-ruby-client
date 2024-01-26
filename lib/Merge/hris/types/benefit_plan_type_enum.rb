# frozen_string_literal: true

module Merge
  module Hris
    # @type [Hash{String => String}]
    BENEFIT_PLAN_TYPE_ENUM = {
      medical: "MEDICAL",
      health_savings: "HEALTH_SAVINGS",
      insurance: "INSURANCE",
      retirement: "RETIREMENT",
      other: "OTHER"
    }.frozen
  end
end
