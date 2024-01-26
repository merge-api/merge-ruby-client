# frozen_string_literal: true

module Merge
  module Accounting
    module Invoices
      # @type [Hash{String => String}]
      INVOICES_LIST_REQUEST_TYPE = {
        accounts_payable: "ACCOUNTS_PAYABLE",
        accounts_receivable: "ACCOUNTS_RECEIVABLE"
      }.frozen
    end
  end
end
