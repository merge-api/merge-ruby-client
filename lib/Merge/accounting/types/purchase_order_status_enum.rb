# frozen_string_literal: true

module Merge
  module Accounting
    # @type [Hash{String => String}]
    PURCHASE_ORDER_STATUS_ENUM = {
      draft: "DRAFT",
      submitted: "SUBMITTED",
      authorized: "AUTHORIZED",
      billed: "BILLED",
      deleted: "DELETED"
    }.frozen
  end
end
