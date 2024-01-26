# frozen_string_literal: true

module Merge
  module Hris
    module BankInfo
      # @type [Hash{String => String}]
      BANK_INFO_LIST_REQUEST_ACCOUNT_TYPE = { checking: "CHECKING", savings: "SAVINGS" }.frozen
    end
  end
end
