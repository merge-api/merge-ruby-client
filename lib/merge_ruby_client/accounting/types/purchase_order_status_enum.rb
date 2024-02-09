# frozen_string_literal: true

module Merge
  module Accounting
    # @type [PURCHASE_ORDER_STATUS_ENUM]
    PURCHASE_ORDER_STATUS_ENUM = {
      draft: "DRAFT",
      submitted: "SUBMITTED",
      authorized: "AUTHORIZED",
      billed: "BILLED",
      deleted: "DELETED"
    }.freeze
  end
end
