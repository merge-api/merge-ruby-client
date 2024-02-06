# frozen_string_literal: true

module Merge
  module Hris
    # @type [POLICY_TYPE_ENUM]
    POLICY_TYPE_ENUM = {
      vacation: "VACATION",
      sick: "SICK",
      personal: "PERSONAL",
      jury_duty: "JURY_DUTY",
      volunteer: "VOLUNTEER",
      bereavement: "BEREAVEMENT"
    }.freeze
  end
end
