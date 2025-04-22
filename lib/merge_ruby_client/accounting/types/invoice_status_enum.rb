# frozen_string_literal: true

module Merge
  module Accounting
    # * `PAID` - PAID
    #  * `DRAFT` - DRAFT
    #  * `SUBMITTED` - SUBMITTED
    #  * `PARTIALLY_PAID` - PARTIALLY_PAID
    #  * `OPEN` - OPEN
    #  * `VOID` - VOID
    class InvoiceStatusEnum
      PAID = "PAID"
      DRAFT = "DRAFT"
      SUBMITTED = "SUBMITTED"
      PARTIALLY_PAID = "PARTIALLY_PAID"
      OPEN = "OPEN"
      VOID = "VOID"
    end
  end
end
