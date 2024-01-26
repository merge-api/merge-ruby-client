# frozen_string_literal: true

module Merge
  module Hris
    # @type [Hash{String => String}]
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
    }.frozen
  end
end
