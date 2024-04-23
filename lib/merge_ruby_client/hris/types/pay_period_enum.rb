# frozen_string_literal: true

module Merge
  module Hris
    # - `HOUR` - HOUR
    #  - `DAY` - DAY
    #  - `WEEK` - WEEK
    #  - `EVERY_TWO_WEEKS` - EVERY_TWO_WEEKS
    #  - `SEMIMONTHLY` - SEMIMONTHLY
    #  - `MONTH` - MONTH
    #  - `QUARTER` - QUARTER
    #  - `EVERY_SIX_MONTHS` - EVERY_SIX_MONTHS
    #  - `YEAR` - YEAR
    class PayPeriodEnum
      HOUR = "HOUR"
      DAY = "DAY"
      WEEK = "WEEK"
      EVERY_TWO_WEEKS = "EVERY_TWO_WEEKS"
      SEMIMONTHLY = "SEMIMONTHLY"
      MONTH = "MONTH"
      QUARTER = "QUARTER"
      EVERY_SIX_MONTHS = "EVERY_SIX_MONTHS"
      YEAR = "YEAR"
    end
  end
end
