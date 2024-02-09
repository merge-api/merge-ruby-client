# frozen_string_literal: true

module Merge
  module Hris
    class Employments
      # @type [EMPLOYMENTS_LIST_REQUEST_EXPAND]
      EMPLOYMENTS_LIST_REQUEST_EXPAND = {
        employee: "employee",
        employee_pay_group: "employee,pay_group",
        pay_group: "pay_group"
      }.freeze
    end
  end
end
