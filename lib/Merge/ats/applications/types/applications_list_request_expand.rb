# frozen_string_literal: true

module Merge
  module Ats
    module Applications
      # @type [Hash{String => String}]
      APPLICATIONS_LIST_REQUEST_EXPAND = {
        candidate: "candidate",
        candidate_credited_to: "candidate,credited_to",
        candidate_credited_to_current_stage: "candidate,credited_to,current_stage",
        candidate_credited_to_current_stage_reject_reason: "candidate,credited_to,current_stage,reject_reason",
        candidate_credited_to_reject_reason: "candidate,credited_to,reject_reason",
        candidate_current_stage: "candidate,current_stage",
        candidate_current_stage_reject_reason: "candidate,current_stage,reject_reason",
        candidate_job: "candidate,job",
        candidate_job_credited_to: "candidate,job,credited_to",
        candidate_job_credited_to_current_stage: "candidate,job,credited_to,current_stage",
        candidate_job_credited_to_current_stage_reject_reason: "candidate,job,credited_to,current_stage,reject_reason",
        candidate_job_credited_to_reject_reason: "candidate,job,credited_to,reject_reason",
        candidate_job_current_stage: "candidate,job,current_stage",
        candidate_job_current_stage_reject_reason: "candidate,job,current_stage,reject_reason",
        candidate_job_reject_reason: "candidate,job,reject_reason",
        candidate_reject_reason: "candidate,reject_reason",
        credited_to: "credited_to",
        credited_to_current_stage: "credited_to,current_stage",
        credited_to_current_stage_reject_reason: "credited_to,current_stage,reject_reason",
        credited_to_reject_reason: "credited_to,reject_reason",
        current_stage: "current_stage",
        current_stage_reject_reason: "current_stage,reject_reason",
        job: "job",
        job_credited_to: "job,credited_to",
        job_credited_to_current_stage: "job,credited_to,current_stage",
        job_credited_to_current_stage_reject_reason: "job,credited_to,current_stage,reject_reason",
        job_credited_to_reject_reason: "job,credited_to,reject_reason",
        job_current_stage: "job,current_stage",
        job_current_stage_reject_reason: "job,current_stage,reject_reason",
        job_reject_reason: "job,reject_reason",
        reject_reason: "reject_reason"
      }.frozen
    end
  end
end
