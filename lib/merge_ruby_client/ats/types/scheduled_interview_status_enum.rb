# frozen_string_literal: true

module Merge
  module Ats
    # @type [SCHEDULED_INTERVIEW_STATUS_ENUM]
    SCHEDULED_INTERVIEW_STATUS_ENUM = {
      scheduled: "SCHEDULED",
      awaiting_feedback: "AWAITING_FEEDBACK",
      complete: "COMPLETE"
    }.freeze
  end
end
