# frozen_string_literal: true

module Merge
  module Ats
    # @type [Hash{String => String}]
    OVERALL_RECOMMENDATION_ENUM = {
      definitely_no: "DEFINITELY_NO",
      no: "NO",
      yes: "YES",
      strong_yes: "STRONG_YES",
      no_decision: "NO_DECISION"
    }.frozen
  end
end
