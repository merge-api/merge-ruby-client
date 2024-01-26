# frozen_string_literal: true

module Merge
  module Hris
    # @type [Hash{String => String}]
    RUN_TYPE_ENUM = {
      regular: "REGULAR",
      off_cycle: "OFF_CYCLE",
      correction: "CORRECTION",
      termination: "TERMINATION",
      sign_on_bonus: "SIGN_ON_BONUS"
    }.frozen
  end
end
