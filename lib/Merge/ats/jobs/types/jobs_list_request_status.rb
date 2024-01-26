# frozen_string_literal: true

module Merge
  module Ats
    module Jobs
      # @type [Hash{String => String}]
      JOBS_LIST_REQUEST_STATUS = {
        archived: "ARCHIVED",
        closed: "CLOSED",
        draft: "DRAFT",
        open: "OPEN",
        pending: "PENDING"
      }.frozen
    end
  end
end
