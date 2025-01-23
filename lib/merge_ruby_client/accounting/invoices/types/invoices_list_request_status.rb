# frozen_string_literal: true

module Merge
  module Accounting
    class Invoices
      class InvoicesListRequestStatus
        DRAFT = "DRAFT"
        OPEN = "OPEN"
        PAID = "PAID"
        PARTIALLY_PAID = "PARTIALLY_PAID"
        SUBMITTED = "SUBMITTED"
        VOID = "VOID"
      end
    end
  end
end
