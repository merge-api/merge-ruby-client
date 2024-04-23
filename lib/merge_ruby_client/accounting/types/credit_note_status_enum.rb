# frozen_string_literal: true

module Merge
  module Accounting
    # - `SUBMITTED` - SUBMITTED
    #  - `AUTHORIZED` - AUTHORIZED
    #  - `PAID` - PAID
    class CreditNoteStatusEnum
      SUBMITTED = "SUBMITTED"
      AUTHORIZED = "AUTHORIZED"
      PAID = "PAID"
    end
  end
end
