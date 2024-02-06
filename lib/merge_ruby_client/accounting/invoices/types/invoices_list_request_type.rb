# frozen_string_literal: true

module Merge
  module Accounting
    class Invoices
      # @type [INVOICES_LIST_REQUEST_TYPE]
      INVOICES_LIST_REQUEST_TYPE = {
        accounts_payable: "ACCOUNTS_PAYABLE",
        accounts_receivable: "ACCOUNTS_RECEIVABLE"
      }.freeze
    end
  end
end
