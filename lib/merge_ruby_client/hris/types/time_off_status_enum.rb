# frozen_string_literal: true

module Merge
  module Hris
    # @type [TIME_OFF_STATUS_ENUM]
    TIME_OFF_STATUS_ENUM = {
      requested: "REQUESTED",
      approved: "APPROVED",
      declined: "DECLINED",
      cancelled: "CANCELLED",
      deleted: "DELETED"
    }.freeze
  end
end
