# frozen_string_literal: true

module Merge
  module Hris
    # @type [Hash{String => String}]
    FLSA_STATUS_ENUM = {
      exempt: "EXEMPT",
      salaried_nonexempt: "SALARIED_NONEXEMPT",
      nonexempt: "NONEXEMPT",
      owner: "OWNER"
    }.frozen
  end
end
