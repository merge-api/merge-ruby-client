# frozen_string_literal: true

module Merge
  module Hris
    class PayrollRuns
      # @type [PAYROLL_RUNS_RETRIEVE_REQUEST_SHOW_ENUM_ORIGINS]
      PAYROLL_RUNS_RETRIEVE_REQUEST_SHOW_ENUM_ORIGINS = {
        run_state: "run_state",
        run_state_run_type: "run_state,run_type",
        run_type: "run_type"
      }.freeze
    end
  end
end
