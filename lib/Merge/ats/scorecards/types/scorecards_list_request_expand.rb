# frozen_string_literal: true

module Merge
  module Ats
    module Scorecards
      # @type [Hash{String => String}]
      SCORECARDS_LIST_REQUEST_EXPAND = {
        application: "application",
        application_interview: "application,interview",
        application_interview_interviewer: "application,interview,interviewer",
        application_interviewer: "application,interviewer",
        interview: "interview",
        interview_interviewer: "interview,interviewer",
        interviewer: "interviewer"
      }.frozen
    end
  end
end
