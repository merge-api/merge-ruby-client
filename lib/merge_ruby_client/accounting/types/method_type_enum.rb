# frozen_string_literal: true

module Merge
  module Accounting
    # - `CREDIT_CARD` - CREDIT_CARD
    #  - `DEBIT_CARD` - DEBIT_CARD
    #  - `ACH` - ACH
    #  - `CASH` - CASH
    #  - `CHECK` - CHECK
    class MethodTypeEnum
      CREDIT_CARD = "CREDIT_CARD"
      DEBIT_CARD = "DEBIT_CARD"
      ACH = "ACH"
      CASH = "CASH"
      CHECK = "CHECK"
    end
  end
end
