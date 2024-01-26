# frozen_string_literal: true

module Merge
  module Accounting
    # @type [Hash{String => String}]
    INVOICE_TYPE_ENUM = { accounts_receivable: "ACCOUNTS_RECEIVABLE", accounts_payable: "ACCOUNTS_PAYABLE" }.frozen
  end
end
