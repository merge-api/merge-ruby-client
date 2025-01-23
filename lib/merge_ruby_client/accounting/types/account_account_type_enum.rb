# frozen_string_literal: true

module Merge
  module Accounting
    # - `BANK` - BANK
    #  - `CREDIT_CARD` - CREDIT_CARD
    #  - `ACCOUNTS_PAYABLE` - ACCOUNTS_PAYABLE
    #  - `ACCOUNTS_RECEIVABLE` - ACCOUNTS_RECEIVABLE
    #  - `FIXED_ASSET` - FIXED_ASSET
    #  - `OTHER_ASSET` - OTHER_ASSET
    #  - `OTHER_CURRENT_ASSET` - OTHER_CURRENT_ASSET
    #  - `OTHER_EXPENSE` - OTHER_EXPENSE
    #  - `OTHER_INCOME` - OTHER_INCOME
    #  - `COST_OF_GOODS_SOLD` - COST_OF_GOODS_SOLD
    #  - `OTHER_CURRENT_LIABILITY` - OTHER_CURRENT_LIABILITY
    #  - `LONG_TERM_LIABILITY` - LONG_TERM_LIABILITY
    #  - `NON_POSTING` - NON_POSTING
    class AccountAccountTypeEnum
      BANK = "BANK"
      CREDIT_CARD = "CREDIT_CARD"
      ACCOUNTS_PAYABLE = "ACCOUNTS_PAYABLE"
      ACCOUNTS_RECEIVABLE = "ACCOUNTS_RECEIVABLE"
      FIXED_ASSET = "FIXED_ASSET"
      OTHER_ASSET = "OTHER_ASSET"
      OTHER_CURRENT_ASSET = "OTHER_CURRENT_ASSET"
      OTHER_EXPENSE = "OTHER_EXPENSE"
      OTHER_INCOME = "OTHER_INCOME"
      COST_OF_GOODS_SOLD = "COST_OF_GOODS_SOLD"
      OTHER_CURRENT_LIABILITY = "OTHER_CURRENT_LIABILITY"
      LONG_TERM_LIABILITY = "LONG_TERM_LIABILITY"
      NON_POSTING = "NON_POSTING"
    end
  end
end