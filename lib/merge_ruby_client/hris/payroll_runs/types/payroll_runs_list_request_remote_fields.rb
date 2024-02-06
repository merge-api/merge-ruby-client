# frozen_string_literal: true

module Merge
  module Hris
    class PayrollRuns
      # @type [PAYROLL_RUNS_LIST_REQUEST_REMOTE_FIELDS]
      PAYROLL_RUNS_LIST_REQUEST_REMOTE_FIELDS = {
        run_state: "run_state",
        run_state_run_type: "run_state,run_type",
        run_type: "run_type"
      }.freeze
    end
  end
end
