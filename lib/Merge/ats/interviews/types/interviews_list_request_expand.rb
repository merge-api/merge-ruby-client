# frozen_string_literal: true

module Merge
  module Ats
    module Interviews
      # @type [Hash{String => String}]
      INTERVIEWS_LIST_REQUEST_EXPAND = {
        application: "application",
        application_job_interview_stage: "application,job_interview_stage",
        interviewers: "interviewers",
        interviewers_application: "interviewers,application",
        interviewers_application_job_interview_stage: "interviewers,application,job_interview_stage",
        interviewers_job_interview_stage: "interviewers,job_interview_stage",
        interviewers_organizer: "interviewers,organizer",
        interviewers_organizer_application: "interviewers,organizer,application",
        interviewers_organizer_application_job_interview_stage: "interviewers,organizer,application,job_interview_stage",
        interviewers_organizer_job_interview_stage: "interviewers,organizer,job_interview_stage",
        job_interview_stage: "job_interview_stage",
        organizer: "organizer",
        organizer_application: "organizer,application",
        organizer_application_job_interview_stage: "organizer,application,job_interview_stage",
        organizer_job_interview_stage: "organizer,job_interview_stage"
      }.frozen
    end
  end
end
