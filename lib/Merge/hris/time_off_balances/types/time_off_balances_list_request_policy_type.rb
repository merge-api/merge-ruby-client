# frozen_string_literal: true

module Merge
  module Hris
    module TimeOffBalances
      # @type [Hash{String => String}]
      TIME_OFF_BALANCES_LIST_REQUEST_POLICY_TYPE = {
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
