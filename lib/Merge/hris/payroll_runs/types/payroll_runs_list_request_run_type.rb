# frozen_string_literal: true

module Merge
  module Hris
    module PayrollRuns
      # @type [Hash{String => String}]
      PAYROLL_RUNS_LIST_REQUEST_RUN_TYPE = {
        correction: "CORRECTION",
        off_cycle: "OFF_CYCLE",
        regular: "REGULAR",
        sign_on_bonus: "SIGN_ON_BONUS",
        termination: "TERMINATION"
      }.frozen
    end
  end
end
