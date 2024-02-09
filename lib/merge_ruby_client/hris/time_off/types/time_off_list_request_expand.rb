# frozen_string_literal: true

module Merge
  module Hris
    class TimeOff
      # @type [TIME_OFF_LIST_REQUEST_EXPAND]
      TIME_OFF_LIST_REQUEST_EXPAND = {
        approver: "approver",
        employee: "employee",
        employee_approver: "employee,approver"
      }.freeze
    end
  end
end
