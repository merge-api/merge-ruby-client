# frozen_string_literal: true

module Merge
  module Hris
    # @type [Hash{String => String}]
    GENDER_ENUM = {
      male: "MALE",
      female: "FEMALE",
      non_binary: "NON-BINARY",
      other: "OTHER",
      prefer_not_to_disclose: "PREFER_NOT_TO_DISCLOSE"
    }.frozen
  end
end
