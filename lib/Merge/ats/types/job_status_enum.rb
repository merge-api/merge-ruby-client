# frozen_string_literal: true

module Merge
  module Ats
    # @type [Hash{String => String}]
    JOB_STATUS_ENUM = {
      open: "OPEN",
      closed: "CLOSED",
      draft: "DRAFT",
      archived: "ARCHIVED",
      pending: "PENDING"
    }.frozen
  end
end
