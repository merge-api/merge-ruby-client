# frozen_string_literal: true

module Merge
  module Accounting
    # * `DRAFT` - DRAFT
    #  * `PENDING_APPROVAL` - PENDING_APPROVAL
    #  * `OPEN` - OPEN
    #  * `PARTIALLY_COMPLETED` - PARTIALLY_COMPLETED
    #  * `COMPLETED` - COMPLETED
    #  * `CLOSED` - CLOSED
    class SalesOrderStatusEnum
      DRAFT = "DRAFT"
      PENDING_APPROVAL = "PENDING_APPROVAL"
      OPEN = "OPEN"
      PARTIALLY_COMPLETED = "PARTIALLY_COMPLETED"
      COMPLETED = "COMPLETED"
      CLOSED = "CLOSED"
    end
  end
end
