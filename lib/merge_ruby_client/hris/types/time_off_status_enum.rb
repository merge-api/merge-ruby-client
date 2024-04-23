# frozen_string_literal: true

module Merge
  module Hris
    # - `REQUESTED` - REQUESTED
    #  - `APPROVED` - APPROVED
    #  - `DECLINED` - DECLINED
    #  - `CANCELLED` - CANCELLED
    #  - `DELETED` - DELETED
    class TimeOffStatusEnum
      REQUESTED = "REQUESTED"
      APPROVED = "APPROVED"
      DECLINED = "DECLINED"
      CANCELLED = "CANCELLED"
      DELETED = "DELETED"
    end
  end
end
