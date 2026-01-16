# frozen_string_literal: true

module Merge
  module Accounting
    # * `DRAFT` - DRAFT
    #  * `IN_PROGRESS` - IN_PROGRESS
    #  * `SHIPPED` - SHIPPED
    #  * `CANCELLED` - CANCELLED
    class ItemFulfillmentStatusEnum
      DRAFT = "DRAFT"
      IN_PROGRESS = "IN_PROGRESS"
      SHIPPED = "SHIPPED"
      CANCELLED = "CANCELLED"
    end
  end
end
