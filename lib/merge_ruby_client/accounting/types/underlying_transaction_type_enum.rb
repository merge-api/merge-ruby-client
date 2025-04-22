# frozen_string_literal: true

module Merge
  module Accounting
    # * `INVOICE` - INVOICE
    #  * `EXPENSE` - EXPENSE
    #  * `TRANSACTION` - TRANSACTION
    #  * `JOURNAL_ENTRY` - JOURNAL_ENTRY
    #  * `PAYMENT` - PAYMENT
    #  * `VENDOR_CREDIT` - VENDOR_CREDIT
    #  * `CREDIT_NOTE` - CREDIT_NOTE
    class UnderlyingTransactionTypeEnum
      INVOICE = "INVOICE"
      EXPENSE = "EXPENSE"
      TRANSACTION = "TRANSACTION"
      JOURNAL_ENTRY = "JOURNAL_ENTRY"
      PAYMENT = "PAYMENT"
      VENDOR_CREDIT = "VENDOR_CREDIT"
      CREDIT_NOTE = "CREDIT_NOTE"
    end
  end
end
