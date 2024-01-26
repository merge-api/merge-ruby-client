# frozen_string_literal: true

module Merge
  module Ats
    # @type [Hash{String => String}]
    SCHEDULED_INTERVIEW_STATUS_ENUM = {
      scheduled: "SCHEDULED",
      awaiting_feedback: "AWAITING_FEEDBACK",
      complete: "COMPLETE"
    }.frozen
  end
end
