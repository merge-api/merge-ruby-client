# frozen_string_literal: true

module Merge
  module Ats
    # @type [Hash{String => String}]
    DISABILITY_STATUS_ENUM = {
      yes_i_have_a_disability_or_previously_had_a_disability: "YES_I_HAVE_A_DISABILITY_OR_PREVIOUSLY_HAD_A_DISABILITY", no_i_dont_have_a_disability: "NO_I_DONT_HAVE_A_DISABILITY", i_dont_wish_to_answer: "I_DONT_WISH_TO_ANSWER"
    }.frozen
  end
end
