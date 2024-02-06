# frozen_string_literal: true

module Merge
  module Hris
    # @type [MARITAL_STATUS_ENUM]
    MARITAL_STATUS_ENUM = {
      single: "SINGLE",
      married_filing_jointly: "MARRIED_FILING_JOINTLY",
      married_filing_separately: "MARRIED_FILING_SEPARATELY",
      head_of_household: "HEAD_OF_HOUSEHOLD",
      qualifying_widow_or_widower_with_dependent_child: "QUALIFYING_WIDOW_OR_WIDOWER_WITH_DEPENDENT_CHILD"
    }.freeze
  end
end
