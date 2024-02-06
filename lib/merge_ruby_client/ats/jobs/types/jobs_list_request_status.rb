# frozen_string_literal: true

module Merge
  module Ats
    class Jobs
      # @type [JOBS_LIST_REQUEST_STATUS]
      JOBS_LIST_REQUEST_STATUS = {
        archived: "ARCHIVED",
        closed: "CLOSED",
        draft: "DRAFT",
        open: "OPEN",
        pending: "PENDING"
      }.freeze
    end
  end
end
