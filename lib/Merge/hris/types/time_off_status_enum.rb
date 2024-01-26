# frozen_string_literal: true

module Merge
  module Hris
    # @type [Hash{String => String}]
    TIME_OFF_STATUS_ENUM = {
      requested: "REQUESTED",
      approved: "APPROVED",
      declined: "DECLINED",
      cancelled: "CANCELLED",
      deleted: "DELETED"
    }.frozen
  end
end
