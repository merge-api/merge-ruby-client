# frozen_string_literal: true

module Merge
  module Hris
    class TimeOff
      # @type [TIME_OFF_LIST_REQUEST_STATUS]
      TIME_OFF_LIST_REQUEST_STATUS = {
        approved: "APPROVED",
        cancelled: "CANCELLED",
        declined: "DECLINED",
        deleted: "DELETED",
        requested: "REQUESTED"
      }.freeze
    end
  end
end
