# frozen_string_literal: true

module Merge
  module Ats
    # @type [Hash{String => String}]
    RACE_ENUM = {
      american_indian_or_alaskan_native: "AMERICAN_INDIAN_OR_ALASKAN_NATIVE",
      asian: "ASIAN",
      black_or_african_american: "BLACK_OR_AFRICAN_AMERICAN",
      hispanic_or_latino: "HISPANIC_OR_LATINO",
      white: "WHITE",
      native_hawaiian_or_other_pacific_islander: "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
      two_or_more_races: "TWO_OR_MORE_RACES",
      decline_to_self_identify: "DECLINE_TO_SELF_IDENTIFY"
    }.frozen
  end
end
