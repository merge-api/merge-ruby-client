# frozen_string_literal: true

module Merge
  module Accounting
    class ExpenseReports
      class ExpenseReportsListRequestExpand
        ACCOUNTING_PERIOD = "accounting_period"
        ACCOUNTING_PERIOD_COMPANY = "accounting_period,company"
        COMPANY = "company"
        EMPLOYEE = "employee"
        EMPLOYEE_ACCOUNTING_PERIOD = "employee,accounting_period"
        EMPLOYEE_ACCOUNTING_PERIOD_COMPANY = "employee,accounting_period,company"
        EMPLOYEE_COMPANY = "employee,company"
        LINES = "lines"
        LINES_ACCOUNTING_PERIOD = "lines,accounting_period"
        LINES_ACCOUNTING_PERIOD_COMPANY = "lines,accounting_period,company"
        LINES_COMPANY = "lines,company"
        LINES_EMPLOYEE = "lines,employee"
        LINES_EMPLOYEE_ACCOUNTING_PERIOD = "lines,employee,accounting_period"
        LINES_EMPLOYEE_ACCOUNTING_PERIOD_COMPANY = "lines,employee,accounting_period,company"
        LINES_EMPLOYEE_COMPANY = "lines,employee,company"
      end
    end
  end
end
