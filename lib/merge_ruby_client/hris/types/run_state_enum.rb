# frozen_string_literal: true

module Merge
  module Hris
    # - `PAID` - PAID
    #  - `DRAFT` - DRAFT
    #  - `APPROVED` - APPROVED
    #  - `FAILED` - FAILED
    #  - `CLOSED` - CLOSED
    class RunStateEnum
      PAID = "PAID"
      DRAFT = "DRAFT"
      APPROVED = "APPROVED"
      FAILED = "FAILED"
      CLOSED = "CLOSED"
    end
  end
end
