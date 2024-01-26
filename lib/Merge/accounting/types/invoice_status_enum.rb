# frozen_string_literal: true

module Merge
  module Accounting
    # @type [Hash{String => String}]
    INVOICE_STATUS_ENUM = {
      paid: "PAID",
      draft: "DRAFT",
      submitted: "SUBMITTED",
      partially_paid: "PARTIALLY_PAID",
      open: "OPEN",
      void: "VOID"
    }.frozen
  end
end
