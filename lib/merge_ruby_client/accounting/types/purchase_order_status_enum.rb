# frozen_string_literal: true

module Merge
  module Accounting
    # * `DRAFT` - DRAFT
    #  * `SUBMITTED` - SUBMITTED
    #  * `AUTHORIZED` - AUTHORIZED
    #  * `BILLED` - BILLED
    #  * `DELETED` - DELETED
    class PurchaseOrderStatusEnum
      DRAFT = "DRAFT"
      SUBMITTED = "SUBMITTED"
      AUTHORIZED = "AUTHORIZED"
      BILLED = "BILLED"
      DELETED = "DELETED"
    end
  end
end
