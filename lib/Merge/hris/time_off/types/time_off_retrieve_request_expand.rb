# frozen_string_literal: true

module Merge
  module Hris
    module TimeOff
      # @type [Hash{String => String}]
      TIME_OFF_RETRIEVE_REQUEST_EXPAND = {
        approver: "approver",
        employee: "employee",
        employee_approver: "employee,approver"
      }.frozen
    end
  end
end
