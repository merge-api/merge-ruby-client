# frozen_string_literal: true

module Merge
  module Hris
    # @type [BENEFIT_PLAN_TYPE_ENUM]
    BENEFIT_PLAN_TYPE_ENUM = {
      medical: "MEDICAL",
      health_savings: "HEALTH_SAVINGS",
      insurance: "INSURANCE",
      retirement: "RETIREMENT",
      other: "OTHER"
    }.freeze
  end
end
