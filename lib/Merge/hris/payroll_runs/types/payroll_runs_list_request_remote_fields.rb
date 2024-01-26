# frozen_string_literal: true

module Merge
  module Hris
    module PayrollRuns
      # @type [Hash{String => String}]
      PAYROLL_RUNS_LIST_REQUEST_REMOTE_FIELDS = {
        run_state: "run_state",
        run_state_run_type: "run_state,run_type",
        run_type: "run_type"
      }.frozen
    end
  end
end
