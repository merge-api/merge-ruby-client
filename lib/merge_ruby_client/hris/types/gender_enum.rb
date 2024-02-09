# frozen_string_literal: true

module Merge
  module Hris
    # @type [GENDER_ENUM]
    GENDER_ENUM = {
      male: "MALE",
      female: "FEMALE",
      non_binary: "NON-BINARY",
      other: "OTHER",
      prefer_not_to_disclose: "PREFER_NOT_TO_DISCLOSE"
    }.freeze
  end
end
