# frozen_string_literal: true

module Merge
  module Hris
    module TimeOff
      # @type [Hash{String => String}]
      TIME_OFF_LIST_REQUEST_STATUS = {
        approved: "APPROVED",
        cancelled: "CANCELLED",
        declined: "DECLINED",
        deleted: "DELETED",
        requested: "REQUESTED"
      }.frozen
    end
  end
end
