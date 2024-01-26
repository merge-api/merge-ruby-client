# frozen_string_literal: true

module Merge
  module Hris
    # @type [Hash{String => String}]
    ETHNICITY_ENUM = {
      american_indian_or_alaska_native: "AMERICAN_INDIAN_OR_ALASKA_NATIVE",
      asian_or_indian_subcontinent: "ASIAN_OR_INDIAN_SUBCONTINENT",
      black_or_african_american: "BLACK_OR_AFRICAN_AMERICAN",
      hispanic_or_latino: "HISPANIC_OR_LATINO",
      native_hawaiian_or_other_pacific_islander: "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
      two_or_more_races: "TWO_OR_MORE_RACES",
      white: "WHITE",
      prefer_not_to_disclose: "PREFER_NOT_TO_DISCLOSE"
    }.frozen
  end
end
