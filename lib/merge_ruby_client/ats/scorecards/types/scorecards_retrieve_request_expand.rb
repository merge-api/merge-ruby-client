# frozen_string_literal: true

module Merge
  module Ats
    class Scorecards
      # @type [SCORECARDS_RETRIEVE_REQUEST_EXPAND]
      SCORECARDS_RETRIEVE_REQUEST_EXPAND = {
        application: "application",
        application_interview: "application,interview",
        application_interview_interviewer: "application,interview,interviewer",
        application_interviewer: "application,interviewer",
        interview: "interview",
        interview_interviewer: "interview,interviewer",
        interviewer: "interviewer"
      }.freeze
    end
  end
end
