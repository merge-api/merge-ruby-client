# frozen_string_literal: true

module Merge
  module Hris
    # @type [FLSA_STATUS_ENUM]
    FLSA_STATUS_ENUM = {
      exempt: "EXEMPT",
      salaried_nonexempt: "SALARIED_NONEXEMPT",
      nonexempt: "NONEXEMPT",
      owner: "OWNER"
    }.freeze
  end
end
