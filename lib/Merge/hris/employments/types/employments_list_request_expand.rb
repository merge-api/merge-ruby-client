# frozen_string_literal: true

module Merge
  module Hris
    module Employments
      # @type [Hash{String => String}]
      EMPLOYMENTS_LIST_REQUEST_EXPAND = {
        employee: "employee",
        employee_pay_group: "employee,pay_group",
        pay_group: "pay_group"
      }.frozen
    end
  end
end
