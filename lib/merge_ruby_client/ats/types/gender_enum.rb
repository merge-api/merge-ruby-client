# frozen_string_literal: true

module Merge
  module Ats
    # @type [GENDER_ENUM]
    GENDER_ENUM = {
      male: "MALE",
      female: "FEMALE",
      non_binary: "NON-BINARY",
      other: "OTHER",
      decline_to_self_identify: "DECLINE_TO_SELF_IDENTIFY"
    }.freeze
  end
end
