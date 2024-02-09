# frozen_string_literal: true

module Merge
  module Hris
    class EmployeePayrollRuns
      # @type [EMPLOYEE_PAYROLL_RUNS_RETRIEVE_REQUEST_EXPAND]
      EMPLOYEE_PAYROLL_RUNS_RETRIEVE_REQUEST_EXPAND = {
        employee: "employee",
        employee_payroll_run: "employee,payroll_run",
        payroll_run: "payroll_run"
      }.freeze
    end
  end
end
