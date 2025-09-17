# frozen_string_literal: true

module Merge
  module Accounting
    # * `DRAFT` - DRAFT
    #  * `SUBMITTED` - SUBMITTED
    #  * `APPROVED` - APPROVED
    #  * `REJECTED` - REJECTED
    class ExpenseReportStatusEnum
      DRAFT = "DRAFT"
      SUBMITTED = "SUBMITTED"
      APPROVED = "APPROVED"
      REJECTED = "REJECTED"
    end
  end
end
