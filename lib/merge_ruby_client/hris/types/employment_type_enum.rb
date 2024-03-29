# frozen_string_literal: true

module Merge
  module Hris
    # @type [EMPLOYMENT_TYPE_ENUM]
    EMPLOYMENT_TYPE_ENUM = {
      full_time: "FULL_TIME",
      part_time: "PART_TIME",
      intern: "INTERN",
      contractor: "CONTRACTOR",
      freelance: "FREELANCE"
    }.freeze
  end
end
