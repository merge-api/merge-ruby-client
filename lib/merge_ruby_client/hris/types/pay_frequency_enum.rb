# frozen_string_literal: true

module Merge
  module Hris
    # @type [PAY_FREQUENCY_ENUM]
    PAY_FREQUENCY_ENUM = {
      weekly: "WEEKLY",
      biweekly: "BIWEEKLY",
      monthly: "MONTHLY",
      quarterly: "QUARTERLY",
      semiannually: "SEMIANNUALLY",
      annually: "ANNUALLY",
      thirteen_monthly: "THIRTEEN-MONTHLY",
      pro_rata: "PRO_RATA",
      semimonthly: "SEMIMONTHLY"
    }.freeze
  end
end
