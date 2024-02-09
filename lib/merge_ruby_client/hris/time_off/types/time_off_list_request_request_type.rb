# frozen_string_literal: true

module Merge
  module Hris
    class TimeOff
      # @type [TIME_OFF_LIST_REQUEST_REQUEST_TYPE]
      TIME_OFF_LIST_REQUEST_REQUEST_TYPE = {
        bereavement: "BEREAVEMENT",
        jury_duty: "JURY_DUTY",
        personal: "PERSONAL",
        sick: "SICK",
        vacation: "VACATION",
        volunteer: "VOLUNTEER"
      }.freeze
    end
  end
end
