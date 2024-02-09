# frozen_string_literal: true

module Merge
  module Hris
    # @type [REQUEST_TYPE_ENUM]
    REQUEST_TYPE_ENUM = {
      vacation: "VACATION",
      sick: "SICK",
      personal: "PERSONAL",
      jury_duty: "JURY_DUTY",
      volunteer: "VOLUNTEER",
      bereavement: "BEREAVEMENT"
    }.freeze
  end
end
