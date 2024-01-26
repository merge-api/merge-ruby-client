# frozen_string_literal: true

module Merge
  module Hris
    # @type [Hash{String => String}]
    PAY_PERIOD_ENUM = {
      hour: "HOUR",
      day: "DAY",
      week: "WEEK",
      every_two_weeks: "EVERY_TWO_WEEKS",
      semimonthly: "SEMIMONTHLY",
      month: "MONTH",
      quarter: "QUARTER",
      every_six_months: "EVERY_SIX_MONTHS",
      year: "YEAR"
    }.frozen
  end
end
