# frozen_string_literal: true

module Merge
  module Ats
    # @type [JOB_STATUS_ENUM]
    JOB_STATUS_ENUM = {
      open: "OPEN",
      closed: "CLOSED",
      draft: "DRAFT",
      archived: "ARCHIVED",
      pending: "PENDING"
    }.freeze
  end
end
