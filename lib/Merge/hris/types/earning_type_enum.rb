# frozen_string_literal: true

module Merge
  module Hris
    # @type [Hash{String => String}]
    EARNING_TYPE_ENUM = {
      salary: "SALARY",
      reimbursement: "REIMBURSEMENT",
      overtime: "OVERTIME",
      bonus: "BONUS"
    }.frozen
  end
end
