# frozen_string_literal: true

module Merge
  module Ats
    module Jobs
      # @type [Hash{String => String}]
      JOBS_SCREENING_QUESTIONS_LIST_REQUEST_EXPAND = {
        job: "job",
        options: "options",
        options_job: "options,job"
      }.frozen
    end
  end
end
