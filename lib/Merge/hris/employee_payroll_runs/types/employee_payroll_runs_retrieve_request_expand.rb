# frozen_string_literal: true

module Merge
  module Hris
    module EmployeePayrollRuns
      # @type [Hash{String => String}]
      EMPLOYEE_PAYROLL_RUNS_RETRIEVE_REQUEST_EXPAND = {
        employee: "employee",
        employee_payroll_run: "employee,payroll_run",
        payroll_run: "payroll_run"
      }.frozen
    end
  end
end
