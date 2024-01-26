# frozen_string_literal: true

module Merge
  module Hris
    module TimeOff
      # @type [Hash{String => String}]
      TIME_OFF_LIST_REQUEST_REQUEST_TYPE = {
        bereavement: "BEREAVEMENT",
        jury_duty: "JURY_DUTY",
        personal: "PERSONAL",
        sick: "SICK",
        vacation: "VACATION",
        volunteer: "VOLUNTEER"
      }.frozen
    end
  end
end
